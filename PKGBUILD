# Maintainer: Marc Demierre <marc.demierre@gmail.com>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=pyenv-virtualenv
pkgver=1.0.0
pkgrel=1
epoch=1
pkgdesc="pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
arch=('any')
url="https://github.com/yyuu/pyenv-virtualenv"
license=('MIT')
depends=('pyenv' 'bash')
source=("https://github.com/yyuu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('3523129c24ca3ad2cf130885ef9801cb066b04eabc354ee2c38c486b8b726f15')

package() {
  mkdir -p "${pkgdir?}"/{opt/pyenv/plugins/pyenv-virtualenv,usr/bin}
  cd "${srcdir?}/$pkgname-$pkgver"
  cp -a -- * "$pkgdir"/opt/pyenv/plugins/pyenv-virtualenv

  for bin in $pkgdir/opt/pyenv/plugins/pyenv-virtualenv/bin/*; do
	  ln -s /opt/pyenv/plugins/pyenv-virtualenv/bin/"$(basename $bin)" "$pkgdir/usr/bin/$(basename $bin)"
  done

  # License
  mkdir -p "$pkgdir"/usr/share/licenses/pyenv-virtualenv
  cp LICENSE "$pkgdir"/usr/share/licenses/pyenv-virtualenv
}

