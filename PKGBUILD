# Maintainer: Testudo Aquatilis
pkgname=nagelfar
_pkgver_main=1
_pkgver_sub=2
_pkgver_subsub=2
pkgver="${_pkgver_main}.${_pkgver_sub}.${_pkgver_subsub}"
_pkgver="${_pkgver_main}${_pkgver_sub}${_pkgver_subsub}"
pkgrel=1
epoch=
pkgdesc="Tcl syntax checker"
arch=('any')
url="http://nagelfar.sourceforge.net/"
license=('GPL')
groups=()
depends=("tcl")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=("https://sourceforge.net/projects/nagelfar/files/Rel_${_pkgver}/${pkgname}${_pkgver}.tar.gz")
source=("http://downloads.sourceforge.net/nagelfar/Rel_${_pkgver}/${pkgname}${_pkgver}.tar.gz")
noextract=()
md5sums=("6482ec3ea21a06ee207f950527ebcb92")
validpgpkeys=()

package() {
    lib_path="/usr/lib/${pkgname}"
    install -d -m755 "${pkgdir}/${lib_path}"

    file_path="lib/textsearch/tcl/textsearch.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"

    file_path="lib/textsearch/pkgIndex.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"

    file_path="packagedb/inifiledb.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="packagedb/registrydb.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="packagedb/snitdb.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="packagedb/sqlite3db.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="packagedb/struct_listdb.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="packagedb/tkdnddb.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="packagedb/vfs_mk4db.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"

    file_path="syntaxbuild.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="syntaxdb84.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="syntaxdb86.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="syntaxdb.tcl"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    file_path="nagelfar.syntax"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"

    file_path="nagelfar.tcl"
    install -D -m755 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"


    doc_path="/usr/share/doc/${pkgname}"
    install -d -m755 "${pkgdir}/${doc_path}"

    file_path="messages.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="call-by-name.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="inlinecomments.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="plugins.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="syntaxdatabases.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="codecoverage.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="syntaxtokens.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"
    file_path="README.txt"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/doc/${file_path}" "${pkgdir}${doc_path}/${file_path}"

    lic_path="/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/${lic_path}"

    file_path="COPYING"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lic_path}/${file_path}"

    install -d -m755 "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s "../lib/${pkgname}/${pkgname}.tcl" "${pkgname}"
}
