pkgname=python-chaospy
pkgver=3.2.6
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-scipy' 'python-numpoly')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('305cfd766a70debafca640f0e4f32263bb9815acf589b290a69eecb7666862bd')

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv chaospy "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/METADATA
}
