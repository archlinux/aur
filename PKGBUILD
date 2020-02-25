pkgname=python-chaospy
pkgver=3.2.3
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-scipy' 'python-numpoly')
source=("https://github.com/jonathf/chaospy/archive/v${pkgver}.tar.gz")
sha256sums=('7311aa257ac2448d86601187956a2b15b3092464fcb8ed41307c859a69b0cbfd')

package() {
  cd "${srcdir}/chaospy-$pkgver"
  python_dir=`python -c "from distutils import sysconfig; print(sysconfig.get_python_lib())"`
  install -d "$pkgdir"/${python_dir}
  cp -rv chaospy "$pkgdir"/${python_dir}
  mkdir "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/
  touch "$pkgdir"/${python_dir}/chaospy-${pkgver}.dist-info/METADATA
}
