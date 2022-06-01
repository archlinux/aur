# Maintainer: Jairo Abreu <jairoabreeu@gmail.com>
# Contributor: Super Bo <supernbo@gmail.com>

pkgname=otf-fira-code-mozilla
pkgver=r1.c4e1f82
pkgrel=1
pkgdesc="Fira Code (Mozilla version) is Fira Mono with less Line Space (1.0) – does not include programming ligatures"
arch=(any)
url='https://github.com/carrois/Fira'
license=("custom: SIL Open Font License")
depends=('fontconfig' 'xorg-font-utils')
conflicts=('otf-fira-code' 'otf-fira-code-git')
install=$pkgname.install
source=(
    "https://github.com/carrois/Fira/raw/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/FiraCode-Bold.otf"
    "https://github.com/carrois/Fira/raw/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/FiraCode-Medium.otf"
    "https://github.com/carrois/Fira/raw/master/Fira_Code_3_2/Fonts/FiraCode_OTF_32/FiraCode-Regular.otf")
sha256sums=('e8f507469bd89f741e922040688c680fb003c39abffd9da49abe45a41cdef486'
            '58426fd0211cd1f95ffa9e7a0250ef16ff6cc87e59586a1a567c81688719dac0'
            '4ea038161248606df9659e0c62c85eef142756765b5809c0ae89df199b09f01f')

pkgver() {
  cd "$srcdir"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm644 "${srcdir}/FiraCode-Bold.otf" "${pkgdir}/usr/share/fonts/OTF/FiraCode-Bold.otf"
    install -Dm644 "${srcdir}/FiraCode-Medium.otf" "${pkgdir}/usr/share/fonts/OTF/FiraCode-Medium.otf"
    install -Dm644 "${srcdir}/FiraCode-Regular.otf" "${pkgdir}/usr/share/fonts/OTF/FiraCode-Regular.otf"
}
