pkgname=python-numpoly
pkgver=0.1.16
pkgrel=1
pkgdesc="Numpy compatible polynomial representation"
arch=('any')
url="https://github.com/jonathf/numpoly"
license=('BSD')
depends=('python-numpy' 'python-six')
source=("https://github.com/jonathf/numpoly/archive/v${pkgver}.tar.gz")
sha256sums=('25034ad97e54e988faad2b5c76980710a4dbda94049392fd3eb2f13d65ce3b77')

package() {
  cd "${srcdir}/numpoly-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv numpoly "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/METADATA
}
