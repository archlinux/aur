pkgname='python-bgutil-ytdlp-pot-provider'
_module='bgutil-ytdlp-pot-provider'
_src_folder='bgutil_ytdlp_pot_provider-1.3.1'
pkgver='1.3.1'
pkgrel=2
pkgdesc="PO Token provider plugin for yt-dlp"
url="https://github.com/Brainicism/bgutil-ytdlp-pot-provider"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
license=('custom:GNU General Public License v3 (GPLv3)')
arch=('any')
noextract=('bgutil_ytdlp_pot_provider-1.3.1.tar.gz')
source=("https://files.pythonhosted.org/packages/ad/3f/fae025f0f4f4e8c40ca24a97f618abba82ad2a221d37ac3df7d6ff705df2/bgutil_ytdlp_pot_provider-1.3.1.tar.gz")
sha256sums=('130635912e2450757438f72068b900076ac1a62d9f26a00afbe6f2ab258e8b25')

install=bgutil-provider.install

prepare() {
  bsdtar -xPf "${srcdir}/${_src_folder}.tar.gz" -C "$srcdir"
}

build() {
  cd "${srcdir}/${_src_folder}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_src_folder}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
