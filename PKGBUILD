# Maintainer: lalala <lalala_233@qq.com>

_name=videocaptioner
pkgname=python-${_name}
pkgver=1.4.1
pkgrel=1
pkgdesc='A powered tool for easy and efficient video subtitling.'
url='https://www.videocaptioner.cn/'
arch=('any')
license=('GPL-3.0')
depends=('python-requests' 'python-openai' 'python-diskcache' 'yt-dlp' 'python-json_repair' 'python-langdetect' 'python-pydub' 'python-tenacity' 'python-pillow' 'python-fonttools' 'python-platformdirs' 'python-tomli' 'ffmpeg')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-hatch-vcs')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('688c8747b5df756980f7a71beccabef2526a7f777b5992edb3a0783816161f85')

build() {
  cd ${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
