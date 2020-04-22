# Maintainer: Martin Diehl <https://martin-diehl.net>
pkgname=python-chaospy
pkgver=3.2.10
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-scipy' 'python-numpoly')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('713f6dea80e8a4d83e54032781883d2359e0a4844a309e06914a394e22a6bfa5')

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv chaospy "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/METADATA
}
