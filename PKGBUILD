# Maintainer:  Justin R. St-Amant <jstamant24 at gmail dot com>
# Contributor: Nicola Bignami <nicola@kernel-panic.no-ip.net>
# Contributor: mickele
# Contributor: Dan Serban
# Contributor: Loui Chang <louipc dot ist at gmail company> (SPAMMERS!)

pkgname=draftsight
pkgver=V1R6.2
pkgrel=1
pkgdesc="Dassault Systemes' freeware CAD software for your DWG files."
arch=('x86_64')
url="http://www.3ds.com/products/draftsight/"
license=('Commercial')
depends=(
  'fontconfig'
  'gcc-libs'
  'glib2'
  'glu'
  'libcups'
  'libgl'
  'libice'
  'libsm'
  'libx11'
  'libxext'
  'libxrender'
  'libxt'
  'mesa'
  'util-linux'
  'zlib'
  'alsa-lib'
)
optdepends=(
  'ati-dri'
  'intel-dri'
  'nouveau-dri'
  'nvidia-utils'
)
provides=('draftsight')
install='draftsight.install'
source=("http://www.draftsight.com/download-linux-fedora")
md5sums=('e3db42fd01850d0f56de7e4b09df5d51')

_pkgprefix='opt/dassault-systemes/DraftSight'

package()
{
    # Perhaps it should be a copy instead, but this is fast on the
    # same filesystem.
    #mv opt "${pkgdir}"/
    mkdir -p "${pkgdir}"/${_pkgprefix}

    mkdir -p "${pkgdir}"/etc/profile.d
    echo "export PATH=\$PATH:/${_pkgprefix}/bin" > $pkgdir/etc/profile.d/$pkgname.sh
    chmod 755 "${pkgdir}"/etc/profile.d/$pkgname.sh

    # Some of these are incompatible with system libraries of the same soname,
    # which will cause problems with applications that depend on them.
    #mkdir -p "${pkgdir}"/etc/ld.so.conf.d
    #echo /${_pkgprefix}/lib > $pkgdir/etc/ld.so.conf.d/$pkgname.conf

    # ln -s"${pkgdir}"/${_pkgprefix}/Eula "${pkgdir}"/usr/share/licenses/draftsight
    install -D "${srcdir}"/${_pkgprefix}/Eula/english/eula.htm "${pkgdir}"/usr/share/licenses/draftsight/eula.htm
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/128x128/program.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/program.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/64x64/program.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/program.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/48x48/program.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/program.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/32x32/program.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/program.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/16x16/program.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/program.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/128x128/file-dwg.png "${pkgdir}"/usr/share/icons/hicolor/128x128/mimetypes/file-dwg.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/64x64/file-dwg.png "${pkgdir}"/usr/share/icons/hicolor/64x64/mimetypes/file-dwg.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/48x48/file-dwg.png "${pkgdir}"/usr/share/icons/hicolor/48x48/mimetypes/file-dwg.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/32x32/file-dwg.png "${pkgdir}"/usr/share/icons/hicolor/32x32/mimetypes/file-dwg.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/16x16/file-dwg.png "${pkgdir}"/usr/share/icons/hicolor/16x16/mimetypes/file-dwg.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/128x128/file-dxf.png "${pkgdir}"/usr/share/icons/hicolor/128x128/mimetypes/file-dxf.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/64x64/file-dxf.png "${pkgdir}"/usr/share/icons/hicolor/64x64/mimetypes/file-dxf.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/48x48/file-dxf.png "${pkgdir}"/usr/share/icons/hicolor/48x48/mimetypes/file-dxf.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/32x32/file-dxf.png "${pkgdir}"/usr/share/icons/hicolor/32x32/mimetypes/file-dxf.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/16x16/file-dxf.png "${pkgdir}"/usr/share/icons/hicolor/16x16/mimetypes/file-dxf.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/128x128/file-dwt.png "${pkgdir}"/usr/share/icons/hicolor/128x128/mimetypes/file-dwt.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/64x64/file-dwt.png "${pkgdir}"/usr/share/icons/hicolor/64x64/mimetypes/file-dwt.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/48x48/file-dwt.png "${pkgdir}"/usr/share/icons/hicolor/48x48/mimetypes/file-dwt.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/32x32/file-dwt.png "${pkgdir}"/usr/share/icons/hicolor/32x32/mimetypes/file-dwt.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/pixmaps/16x16/file-dwt.png "${pkgdir}"/usr/share/icons/hicolor/16x16/mimetypes/file-dwt.png
    install -D "${srcdir}"/${_pkgprefix}/Resources/dassault-systemes_draftsight-dwg.xml "${pkgdir}"/usr/share/mime/application/dassault-systemes_draftsight-dwg.xml
    install -D "${srcdir}"/${_pkgprefix}/Resources/dassault-systemes_draftsight-dxf.xml "${pkgdir}"/usr/share/mime/application/dassault-systemes_draftsight-dxf.xml
    install -D "${srcdir}"/${_pkgprefix}/Resources/dassault-systemes_draftsight-dwt.xml "${pkgdir}"/usr/share/mime/application/dassault-systemes_draftsight-dwt.xml
    install -D "${srcdir}"/${_pkgprefix}/Resources/dassault-systemes_draftsight.desktop "${pkgdir}"/usr/share/applications/dassault-systemes_draftsight.desktop

    cp -pr ${srcdir}/${_pkgprefix}/* ${pkgdir}/${_pkgprefix}/
}
