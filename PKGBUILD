pkgname=python-chaospy
pkgver=3.2.4
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-scipy' 'python-numpoly')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('4a6bf09374002f853e56d3600efc198160a51c7c857c56334c163f6c40d3f8a1')

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv chaospy "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/METADATA
}
