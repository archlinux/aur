# Maintainer: huochenghai <huochenghai@gmail.com>
pkgname="llm-wiki-bin"
pkgver="0.4.5"
pkgrel=1
pkgdesc="LLM Wiki is a cross-platform desktop application that turns your documents into an organized, interlinked knowledge base — automatically."
arch=("x86_64")
url="https://github.com/nashsu/llm_wiki"
_github_url="https://github.com/nashsu/llm_wiki"
makedepends=("binutils" "tar")
depends=(glibc webkit2gtk-4.1 libgcc glib2 gtk3 gdk-pixbuf2 xz libsoup3 hicolor-icon-theme cairo)
provides=("llm-wiki=${pkgver}")
conflicts=(llm-wiki llm-wiki-appimage)
license=("GPL-3.0-only")
source=("${_github_url}/releases/download/v${pkgver}/LLM.Wiki_${pkgver}_amd64.deb")
sha256sums=('e2b934e8c3c2290e30a8b48ff0afa7b3b73d8084d61d7d25574e4e30e31c31f3')

prepare() {
        ar p LLM.Wiki_${pkgver}_amd64.deb data.tar.gz | tar --zstd -x
}

package() {
        cd $srcdir
        cp -R usr ${pkgdir}
}
