# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=pyenv-virtualenv
pkgver=20151103
pkgrel=1
pkgdesc="pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
arch=('any')
url="https://github.com/yyuu/pyenv-virtualenv"
license=('MIT')
depends=('pyenv')
source=("https://github.com/yyuu/$pkgname/archive/v$pkgver.zip")
md5sums=('a24ff32f55b4d9e7e3c130b0944d8f29')

package() {
  mkdir -p "${pkgdir?}"/{opt/pyenv/plugins/pyenv-virtualenv,usr/bin}
  cd "${srcdir?}/$pkgname-$pkgver"
  cp -a -- * "$pkgdir"/opt/pyenv/plugins/pyenv-virtualenv

  for bin in $pkgdir/opt/pyenv/plugins/pyenv-virtualenv/bin/*; do
	  ln -s /opt/pyenv/plugins/pyenv-virtualenv/bin/"$(basename $bin)" "$pkgdir/usr/bin/$(basename $bin)"
  done
}

