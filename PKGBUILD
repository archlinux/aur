_reponame=ydweb
pkgname=$_reponame-git
pkgver=1.0
pkgrel=1
pkgdesc="Console-based dictionary with contents crawled from the youdao website; offline dictionaries with common words are available."
license=(GPL3)
arch=("i686" "x86_64")
url="https://github.com/purboo/ydweb"
depends=(python-requests python-pyquery python-prompt_toolkit)
source=("git://github.com/purboo/ydweb.git")
md5sums=("SKIP")

package() {
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/share"
    cp -r "${_reponame}" "${pkgdir}/usr/share/"

    mkdir -p "${pkgdir}/usr/bin"
    ln -sf "/usr/share/${_reponame}/ydweb.py" "${pkgdir}/usr/bin/ydweb"
}

