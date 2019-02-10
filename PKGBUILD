# Maintainer: Ayrton Araujo <root@ayr-ton.net>
# Contributor: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=pyenv-virtualenv
pkgver=1.1.4
pkgrel=2
epoch=1
pkgdesc="pyenv plugin to manage virtualenv (a.k.a. python-virtualenv)"
arch=('any')
url="https://github.com/pyenv/pyenv-virtualenv"
license=('MIT')
depends=('pyenv' 'bash')
source=("https://github.com/pyenv/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('81629fac496b9bad8dabebe2e90841e5')

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
