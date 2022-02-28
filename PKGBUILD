# Maintainer: Alice S. <quarkyalice@disroot.org>
pkgname=propertree-git
pkgver=r392.79a329f
pkgrel=1
pkgdesc="Cross platform GUI plist editor written in python."
arch=('any')
url="https://github.com/corpnewt/ProperTree"
license=('BSD')
depends=('python3' 'tk')
source=("${pkgname}::git+$url"
        "ProperTree.desktop"
        "ProperTree"
        "ProperTree.png")
noextract=()
sha256sums=('SKIP'
            'e788f1b98035a6293490411ba606618d1a0507e3403a38fef90a63010917e58c'
            '802aac15fd9115d6a1ce98ba14c597737595af938ae6fb0e8a62fde719dd5357'
            'af2748672492af4c6d83070b4df8956c278db5cd83150dce9ea5ac3c37823137')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "${pkgdir}/opt/ProperTree"
    cp -r "${srcdir}/${pkgname}/"* "${pkgdir}/opt/ProperTree" -R
    install -Dm755 "${srcdir}/ProperTree" "${pkgdir}/usr/bin/ProperTree"
    install -Dm644 "${srcdir}/ProperTree.desktop" "${pkgdir}/usr/share/applications/ProperTree.desktop"
    install -Dm644 "${srcdir}/ProperTree.png" "${pkgdir}/usr/share/pixmaps/ProperTree.png"
}
