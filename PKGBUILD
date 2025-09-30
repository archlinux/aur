# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abenz1267
_pkgname=elephant
pkgbase=${_pkgname}-bin
pkgname=(${_pkgname}-bin ${_pkgname}-websearch-bin ${_pkgname}-unicode-bin ${_pkgname}-todo-bin ${_pkgname}-symbols-bin ${_pkgname}-runner-bin ${_pkgname}-providerlist-bin ${_pkgname}-menus-bin ${_pkgname}-files-bin ${_pkgname}-desktopapplications-bin ${_pkgname}-clipboard-bin ${_pkgname}-calc-bin ${_pkgname}-archlinuxpkgs-bin)
pkgver=1.1.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="general purpose datasource and executor"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc')
optdepends=('elephant-providerlist: providerlist provider'
            'elephant-desktopapplications: desktopapplications provider'
            'elephant-archlinuxpkgs: archlinuxpkgs provider'
            'elephant-calc: calc provider'
            'elephant-clipboard: clipboard provider'
            'elephant-files: files provider'
            'elephant-menus: menus provider'
            'elephant-runner: runner provider'
            'elephant-symbols: symbols provider'
            'elephant-todo: todo provider'
            'elephant-unicode: unicode provider'
            'elephant-websearch: websearch provider')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("elephant-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/elephant-linux-${_barch[0]}.tar.gz"
               "websearch-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/websearch-linux-${_barch[0]}.tar.gz"
               "unicode-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/unicode-linux-${_barch[0]}.tar.gz"
               "todo-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/todo-linux-${_barch[0]}.tar.gz"
               "symbols-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/symbols-linux-${_barch[0]}.tar.gz"
               "runner-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/runner-linux-${_barch[0]}.tar.gz"
               "providerlist-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/providerlist-linux-${_barch[0]}.tar.gz"
               "menus-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/menus-linux-${_barch[0]}.tar.gz"
               "files-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/files-linux-${_barch[0]}.tar.gz"
               "desktopapplications-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/desktopapplications-linux-${_barch[0]}.tar.gz"
               "clipboard-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/clipboard-linux-${_barch[0]}.tar.gz"
               "calc-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/calc-linux-${_barch[0]}.tar.gz"
               "archlinuxpkgs-${arch[0]}-${pkgver}.tgz::${url}/releases/download/v${pkgver}/archlinuxpkgs-linux-${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'b52cbce3fbd7f99501d766922db595241574bd07d93316e8a9d2cf418a608e3a')
sha256sums_x86_64=('59425a2057e9dc0db1c34ddb0f421572d55eca6446882adb0d8a2a00fea6b2f8'
                   '3c706f1f323f0fff68ac3e442ba7a76cb3358122c667c76e8611699bc5f385bb'
                   '3cde9a843100ddf20abf89efacba8beca31a5c954823005b9e586c209c6743d4'
                   'bca50f9355e7c9d1fd8fcc4bd59c5c98b15898aa9131839d7e736a44116235bc'
                   '3180ca5ef6cb9ce8f47627641bdce0407ad508c6817cd6764aeb0fc4e1c218ab'
                   '9c9136d7cf891fbe6c0b36363f2a46b7d8b8c03e54d03a0b6b8f65470c495660'
                   '3654e03c7d7213373a83bcb2d6f35893bf3508684eafe6d5011993d70c83eeca'
                   'fbfcf4f2ffad97bc5bd8d15c27a9edf3e9b9082ed3579327ddf9ad6b99476ab1'
                   '7fe2eca7d69cb5cd1a80d21054f2b2d0b9f37c92d3ea61cf4549545ff774bc30'
                   '6961d9049141cd7d0a7b48fd8f725b4916d857402aea33db5593bafc9f171410'
                   '0aaa8629c083e9580f70384c9f1bb591aa9e8328f95b6dee34fbd1c8cccfd2a9'
                   '9393bfbc601dd9119433a434489b1f987ddba1ab489843d9e3bd3a1a6f286a25'
                   '348bcd413ecf9b82b3ea04b23566140b836f0876e0eaace0f5700deec2a2ccd9')

case $CARCH in
    ${arch[0]})
        _CARCH=${_barch[0]}
        ;;
esac

package_elephant-bin() {
    cd "${srcdir}/" || exit

    install -Dm755 "${_pkgname}-linux-${_CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-websearch-bin() {
    pkgdesc='websearch provider for elephant'

    conflicts=("${_pkgname}-websearch")
    provides=("${_pkgname}-websearch")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "websearch-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/websearch.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-unicode-bin() {
    pkgdesc='unicode provider for elephant'

    conflicts=("${_pkgname}-unicode")
    provides=("${_pkgname}-unicode")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "unicode-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/unicode.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-todo-bin() {
    pkgdesc='todo provider for elephant'

    conflicts=("${_pkgname}-todo")
    provides=("${_pkgname}-todo")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "todo-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/todo.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-symbols-bin() {
    pkgdesc='symbols provider for elephant'

    conflicts=("${_pkgname}-symbols")
    provides=("${_pkgname}-symbols")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "symbols-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/symbols.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-runner-bin() {
    pkgdesc='runner provider for elephant'

    conflicts=("${_pkgname}-runner")
    provides=("${_pkgname}-runner")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "runner-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/runner.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-providerlist-bin() {
    pkgdesc='providerlist provider for elephant'

    conflicts=("${_pkgname}-providerlist")
    provides=("${_pkgname}-providerlist")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "providerlist-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/providerlist.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-menus-bin() {
    pkgdesc='menus provider for elephant'

    conflicts=("${_pkgname}-menus")
    provides=("${_pkgname}-menus")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "menus-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/menus.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-files-bin() {
    pkgdesc='files provider for elephant'

    conflicts=("${_pkgname}-files")
    provides=("${_pkgname}-files")
    depends+=("${_pkgname}" "fd")

    cd "${srcdir}/" || exit

    install -Dm755 "files-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/files.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-desktopapplications-bin() {
    pkgdesc='desktopapplications provider for elephant'

    conflicts=("${_pkgname}-desktopapplications")
    provides=("${_pkgname}-desktopapplications")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "desktopapplications-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/desktopapplications.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-clipboard-bin() {
    pkgdesc='clipboard provider for elephant'

    conflicts=("${_pkgname}-clipboard")
    provides=("${_pkgname}-clipboard")
    depends+=("${_pkgname}" "wl-clipboard")

    cd "${srcdir}/" || exit

    install -Dm755 "clipboard-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/clipboard.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-calc-bin() {
    pkgdesc='calc provider for elephant'

    conflicts=("${_pkgname}-calc")
    provides=("${_pkgname}-calc")
    depends+=("${_pkgname}" "libqalculate")

    cd "${srcdir}/" || exit

    install -Dm755 "calc-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/calc.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_elephant-archlinuxpkgs-bin() {
    pkgdesc='archlinuxpkgs provider for elephant'

    conflicts=("${_pkgname}-archlinuxpkgs")
    provides=("${_pkgname}-archlinuxpkgs")
    depends+=("${_pkgname}")

    cd "${srcdir}/" || exit

    install -Dm755 "archlinuxpkgs-linux-${_CARCH}.so" "${pkgdir}/etc/xdg/${_pkgname}/providers/archlinuxpkgs.so"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

