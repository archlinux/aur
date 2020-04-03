pkgname=python-numpoly
pkgver=0.1.13
pkgrel=1
pkgdesc="Numpy compatible polynomial representation"
arch=('any')
url="https://github.com/jonathf/numpoly"
license=('BSD')
depends=('python-numpy' 'python-six')
source=("https://github.com/jonathf/numpoly/archive/v${pkgver}.tar.gz")
sha256sums=('32d7227b511dbc028be70f3c5766331a8dd5a6b55a3a6aaa94a307e24ef18aad')

package() {
  cd "${srcdir}/numpoly-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv numpoly "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/METADATA
}
