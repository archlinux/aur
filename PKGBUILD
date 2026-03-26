pkgname=python-powerlaw
_pkgname=powerlaw
pkgver=2.0.0
pkgrel=1
pkgdesc='Toolbox for testing if a probability distribution fits a power law'
arch=('any')
url='https://github.com/powerlaw-devs/powerlaw'
license=('MIT')
depends=('python' 'python-setuptools' 'python-numpy' 'python-mpmath' 'python-matplotlib' 'python-scipy' 'python-tqdm')
source=("https://github.com/powerlaw-devs/powerlaw/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d1afa228c47e7d5177514f3dfe0e2b9160610b5a20c1386d07be703a5492f99c')

build() {
  cd "$_pkgname-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_POWERLAW="$pkgver" python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl 
}
