pkgname=mitogen
pkgver=0.3.10
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.networkgenomics.com/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/mitogen-hq/mitogen/archive/v${pkgver//_/-}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-${pkgver//_/-}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha1sums=('42066c419749a3bdbfca5d3a54167b392b95ab0d')
sha256sums=('d4d9e10e1da89b76edb36207ec429153389eb5e88ae5519cbb0cef13620c24cd')
sha384sums=('b590aca3429f86ebe242963e417116a7c50a2f8486c1c53c0480a5b597db13508782e4f66b6cf8b7f592d3e3472afb56')
sha512sums=('4ececa23e8bf5ba256b9532c147020f6e7020974bf47d4624f29c30936b74817a72dc0aae6035b1d44228169da28c74a93052e236306642a0b8c638ec4d84666')
