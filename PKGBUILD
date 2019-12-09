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
optdepends=('nerd-fonts-complete: to get Unicode symbols'
            'nerd-fonts-complete-mono-glyphs: to get Unicode symbols'
            'nerd-fonts-dejavu-complete: to get Unicode symbols'
            'nerd-fonts-fira-mono: to get Unicode symbols'
            'nerd-fonts-git: to get Unicode symbols'
            'nerd-fonts-hack: to get Unicode symbols'
            'nerd-fonts-inconsolata: to get Unicode symbols'
            'nerd-fonts-noto-sans-regular-complete: to get Unicode symbols'
            'nerd-fonts-roboto-mono: to get Unicode symbols'
            'nerd-fonts-source-code-pro: to get Unicode symbols'
            'nerd-fonts-terminus: to get Unicode symbols'
            'otf-nerd-fonts-fira-code: to get Unicode symbols'
            'ttf-consolas-with-yahei-powerline-git: to get Unicode symbols'
            'ttf-nerd-fonts-hack-complete-git: to get Unicode symbols')
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
