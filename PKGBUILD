# Maintainer:  Alexander Puls <x.com [at] mailbox.org>
# Contributor: Alexander Puls <x.com [at] mailbox.org>

pkgname=clweather
_pkgname=clweather.py
pkgver=1.2.r0.gbcca994
pkgrel=1
pkgdesc="small weather forecast script for the command line"
arch=('any')
url='https://gitlab.com/0vv1/clweather'
license=('GPL3')
groups=()
depends=('python' 'python-argparse' 'python-requests')
optdepends=('nerd-fonts-ANY: to get the Unicode symbols of Weather Icons OR'
            'ttf-nerd-fonts-ANY: to get correct Unicode symbols OR'
            'otf-nerd-fonts-ANY: to get correct Unicode symbols')
makedepends=('git' 'sed')
provides=($pkgname)
conflicts=($pkgname)
source=("git+https://gitlab.com/0vv1/clweather.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$pkgname"
}
