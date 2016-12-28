# Maintainer: twa022 <twa022 at gmail dot com>

_pkgnamefmt=LibreOffice
_pkgname=libreoffice
pkgname=${_pkgname}-dev-bin
_LOver=5.3.0.1
pkgver=5.3.0.1
_basever=5.3
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL3')
url="http://www.libreoffice.org/"
pkgdesc="LibreOffice development branch"
depends=('curl>=7.20.0' 'hunspell>=1.2.8' 'python>=3.5' 'libwpd>=0.9.2' 'libwps'
         'neon>=0.28.6' 'pango' 'nspr' 'libjpeg' 'libxrandr' 'libgl' 'dbus-glib'
         'libxslt' 'redland' 'hyphen' 'lpsolve' 'gcc-libs' 'sh' 'graphite' #'icu'
		 'lcms2' 'poppler>=0.24.0' 'libvisio' 'libetonyek' 'libodfgen' 'libcdr'
		 'libmspub' 'harfbuzz-icu' 'glew' 'nss' 'clucene' 'hicolor-icon-theme'
		 'desktop-file-utils' 'shared-mime-info' 'glu' 'libpagemaker'
		 'libxinerama' 'libabw' 'libmwaw' 'libe-book' 'libcups' 'gtk2'
		 'liborcus' 'liblangtag' 'libexttextcat' 'libfbclient' 'libcmis')
optdepends=('java-runtime:          adds java support'
            'java-environment:      required by extension-wiki-publisher and extension-nlpsolver'
            'pstoedit:              translates PostScript and PDF graphics into other vector formats'
            'libmythes:             for use in thesaurus'
            'beanshell:             interactive java -- good for prototyping/macros'
            'libmspack:             library for Microsoft compression formats for use in FontOOo'
            'libwpg:                library for importing and converting WordPerfect Graphics format'
            'sane:                  for scanner access'
            'unixodbc:              adds ODBC database support'
            'gst-plugins-base-libs: for multimedia content, e.g. in Impress'
            'libpaper:              takes care of papersize'
            'postgresql-libs:       for postgresql-connector'
            'coin-or-mp:	          required by the Calc solver'
            'gtk3:                  for GTK3 integration'
            'kdelibs:               for KDE desktop integration')
provides=('libreoffice' 'libreoffice-en-US')

source_i686=("http://dev-builds.libreoffice.org/pre-releases/rpm/x86/${_pkgnamefmt}_${_LOver}_Linux_x86_rpm.tar.gz")
source_x86_64=("http://dev-builds.libreoffice.org/pre-releases/rpm/x86_64/${_pkgnamefmt}_${_LOver}_Linux_x86-64_rpm.tar.gz")
sha256sums_i686=('74b697d07e084bea82c0436d590b9abd1784d27810d13e5f049ac93442d60164')
sha256sums_x86_64=('0e37e1ac084a66105bbe3939848d2d6bef6382f0a173893a3604e2c9c07b5e7e')

package() {
	cd ${_pkgnamefmt}_${_LOver}*/RPMS

	for rpm in *rpm ; do
		bsdtar -x -f ${rpm} -C ${pkgdir}
	done
}
