pkgname=python-numpoly
pkgver=0.1.8
pkgrel=1
pkgdesc="Numpy compatible polynomial representation"
arch=('any')
url="https://github.com/jonathf/numpoly"
license=('BSD')
depends=('python-numpy')
source=("https://github.com/jonathf/numpoly/archive/v${pkgver}.tar.gz")
sha256sums=('1c8a7b1343abbe0f407e1f0cbdfbd0270cfab8eef059d9a45f985b076f854534')

package() {
  cd "${srcdir}/numpoly-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv numpoly "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/numpoly-${pkgver}.dist-info/METADATA
}
