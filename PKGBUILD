# Maintainer: Ben Oliver <ben@bfoliver.com>

pkgname=bukuserver
pkgver=4.2.2
pkgrel=1
pkgdesc="Powerful command-line bookmark manager. CLI and server."
arch=('any')
depends=('python' 'python-beautifulsoup4' 'python-cryptography' 'python-urllib3' 'python-certifi' 'python-html5lib' 'python-appdirs' 'python-arrow' 'python-cffi' 'python-click' 'python-flask-admin' 'python-flask-api' 'python-flask-bootstrap' 'python-flask-paginate' 'python-flask-wtf' 'python-idna' 'python-itsdangerous' 'python-jinja' 'python-markupsafe' 'python-packaging' 'python-pyasn1' 'python-pycparser' 'python-requests' 'python-six' 'python-werkzeug')
makedepends=('make')
conflicts=('buku')
provides=('buku')
url="https://github.com/jarun/Buku"
license=('GPL3')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/jarun/Buku/tar.gz/v$pkgver)
sha256sums=('08866f284a03454d9ee5bbb332da62e6ae1dfbe83ada75092453a7fd04fe62b3')

package() {
  cd "$srcdir/Buku-$pkgver"
  python setup.py install --root="${pkgdir}" --prefix=/usr
  install -Dm644 auto-completion/fish/buku.fish "${pkgdir}/usr/share/fish/vendor_completions.d/buku.fish"
  install -Dm644 auto-completion/bash/buku-completion.bash "${pkgdir}/etc/bash_completion.d/buku"
  install -Dm644 auto-completion/zsh/_buku "${pkgdir}/usr/share/zsh/site-functions/_buku"
}
