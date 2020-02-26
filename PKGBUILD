pkgname=python-numpoly
pkgver=0.1.11
pkgrel=1
pkgdesc="Numpy compatible polynomial representation"
arch=('any')
url="https://github.com/jonathf/numpoly"
license=('BSD')
depends=('python-numpy')
source=("https://github.com/jonathf/numpoly/archive/v${pkgver}.tar.gz")
sha256sums=('86935940bd9059823dafbb7599bc0f37f3239e6ebbe744d6307323072956cb7a')

package() {
  cd "${srcdir}/numpoly-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv numpoly "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/METADATA
}
