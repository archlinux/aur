pkgname=python-chaospy
pkgver=3.2.9
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-scipy' 'python-numpoly')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('dd4a4535c66e488875b563fca7c59493e694dffffc474d3de9da06d9dd8c07b8')

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv chaospy "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/METADATA
}
