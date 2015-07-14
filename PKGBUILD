# Maintainer: Jack Parsons < jack_parsonsis(at)hotmail.com > 

pkgname=aurtab
pkgver=1
pkgrel=2
pkgdesc='AUR tab completion for yaourt using zsh.'
arch=('any')
url='https://github.com/worzel666/aurtab'
license=('GPL')
makedepends=('git')
depends=('python' 'python-requests' 'zsh')
install=${pkgname}.install
provides=('aurtab')
conflicts=('aurtab' 'zsh-completions')
source=('git+https://github.com/worzel666/aurtab.git')
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  rm -rf *.git readme.md
  mkdir -p $pkgdir/usr/share/zsh/site-functions/
  mkdir $pkgdir/usr/bin/
  cp _yaourt $pkgdir/usr/share/zsh/site-functions/
  install aurtab.py $pkgdir/usr/bin/aurtab 
  chmod +x $pkgdir/usr/bin/aurtab

}

