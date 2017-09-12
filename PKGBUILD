# Maintainer: Marc Demierre <marc.demierre@gmail.com>
pkgname=pyenv-virtualenvwrapper
pkgver=20140609
pkgrel=1
epoch=0
pkgdesc="An alternative approach to manage virtualenvs from pyenv."
arch=('any')
url="https://github.com/pyenv/pyenv-virtualenvwrapper"
license=('MIT')
depends=('pyenv' 'python-virtualenvwrapper' 'bash')
source=("https://github.com/pyenv/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('35dcafed8b60ad94e597fae8638c16c9')

package() {
  mkdir -p "${pkgdir?}"/{opt/pyenv/plugins/pyenv-virtualenvwrapper,usr/bin}
  cd "${srcdir?}/$pkgname-$pkgver"
  cp -a -- * "$pkgdir"/opt/pyenv/plugins/pyenv-virtualenvwrapper

  for bin in $pkgdir/opt/pyenv/plugins/pyenv-virtualenvwrapper/bin/*; do
	  ln -s /opt/pyenv/plugins/pyenv-virtualenvwrapper/bin/"$(basename $bin)" "$pkgdir/usr/bin/$(basename $bin)"
  done

  # License
  mkdir -p "$pkgdir"/usr/share/licenses/pyenv-virtualenvwrapper
  cp LICENSE "$pkgdir"/usr/share/licenses/pyenv-virtualenvwrapper
}

