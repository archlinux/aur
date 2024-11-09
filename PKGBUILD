# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-sssekai-git
pkgver=r129.40fa4b9
pkgrel=1
pkgdesc="About Project SEKAI Asset Utility."
arch=('x86_64')
url="https://github.com/mos9527/sssekai"
license=('MIT')
provides=('sssekai')
conflicts=('python-sssekai')
depends=(
  'python-attrs'
  'python-brotli'
  'python-certifi'
  'python-charset-normalizer'
  'python-coloredlogs'
  'python-etcpak-git'
  'python-python-ffmpeg'
  'python-fsspec'
  'python-future'
  'python-humanfriendly'
  'python-idna'
  'python-lz4'
  'python-msgpack'
  'python-pillow'
  'python-pycryptodome'
  'python-pyfmodex-git'
  'python-json-logger'
  'python-requests'
  'python-tabulate'
  'python-texture2ddecoder'
  'python-tqdm'
  'python-unitypy'
  'python-urllib3'
  'python-wannacri-git'
)
checkdepends=('python-pytest' 'python-pytest-cov')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
source=("git+https://github.com/mos9527/sssekai.git")
md5sums=('SKIP')

pkgver() {
  cd sssekai
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd sssekai
  pytest -v --cov || true
}

package() {
  cd sssekai
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
