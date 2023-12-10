# Maintainer: zebdo < zebdo [4T] posteo [D0T] ee >

pkgname='hydrus-video-deduplicator-git'
pkgver=0.4.2
pkgrel=1
pkgdesc='Hydrus Video Deduplicator finds potential duplicate videos through the Hydrus API'
arch=('any')
url="https://github.com/hydrusvideodeduplicator/hydrus-video-deduplicator"
license=('MIT')
depends=(
  'python'
  'python-platformdirs'
  'python-rich'
  'python-numpy'
  'python-tqdm'
  'python-dotenv'
  'python-typer'
  'python-sqlitedict'
  'python-requests'
  'python-psutil'
  'python-joblib'
  'python-pillow'
  'python-pyavm'
  'python-av'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
	'python-hatchling'
	)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b8ec607b50529e8ac2f0a1f7e1e612f7bfc38484eb9aaacab1f7c244d09ddc82')
_archive="hydrus-video-deduplicator-$pkgver"

build() {
	ls -l
	cd "$_archive"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_archive"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
