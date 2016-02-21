# Maintainer: Sebastian Lau <archlinux _at_ slau _dot_ info>
# Maintainer: Eric Ozwigh <ozwigh at gmail dot com>

pkgname=veracrypt
_pkgname=VeraCrypt
pkgver=1.17
_pkgver=${pkgver//_/-}
pkgrel=2
pkgdesc="Disk encryption with strong security based on TrueCrypt"
arch=('i686' 'x86_64') #'armv6h' 'armv7h')
url="http://veracrypt.codeplex.com/"
license=('custom')
depends=('fuse' 'wxgtk>=3.0')
makedepends=('nasm')
install='veracrypt.install'

source_x86_64=(	#"https://archlinux.0ptr.de/mirrors/veracrypt/${pkgver}/${pkgname}_${pkgver}_amd64.tar.gz"
		#"https://archlinux.0ptr.de/mirrors/veracrypt/${pkgver}/${pkgname}_${pkgver}_amd64.tar.gz.sig")
		"veracrypt_1.17_amd64.tar.gz::https://www.dropbox.com/s/n985f3vcmq5wsws/veracrypt_1.17_amd64.tar.gz?raw=1"
		"veracrypt_1.17_amd64.tar.gz.sig::https://www.dropbox.com/s/052jhd3swziqfvu/veracrypt_1.17_amd64.tar.gz.sig?raw=1")
source_i686=(	#"https://archlinux.0ptr.de/mirrors/veracrypt/${pkgver}/${pkgname}_${pkgver}_i386.tar.gz"
		#"https://archlinux.0ptr.de/mirrors/veracrypt/${pkgver}/${pkgname}_${pkgver}_i386.tar.gz.sig")
		"veracrypt_1.17_i386.tar.gz::https://www.dropbox.com/s/go6m9xi9h4kab2j/veracrypt_1.17_i386.tar.gz?raw=1"
		"veracrypt_1.17_i386.tar.gz.sig::https://www.dropbox.com/s/z3oz7i2cgmqjce8/veracrypt_1.17_i386.tar.gz.sig?raw=1")
#source=("${pkgname}_${pkgver}_Source.tar.bz2::http://sourceforge.net/projects/${pkgname}/files/${_pkgname} ${pkgver}/${pkgname}_${pkgver}_Source.tar.bz2/download"
	#"${pkgname}_${pkgver}_Source.tar.bz2.sig::http://sourceforge.net/projects/${pkgname}/files/${_pkgname} ${pkgver}/${pkgname}_${pkgver}_Source.tar.bz2.sig/download"
source=("no_makeself.patch"
        "veracrypt.desktop"
        "veracrypt.install")
sha1sums=('0cbe9f7875ab52be125cc575533f76fab60314a5'
          'ebdd450e719fe3cff5e459f027856cbaf03db13a'
          '14dceabf658a7e3505c855c2862aa86e343fcda5')
sha1sums_i686=('479fad1cfe53fef9155dd7ef9c28dd2ecb5d9be4'
               'SKIP')
sha1sums_x86_64=('b8aa201c42b4dda3233722066bd17fcac600d301'
                 'SKIP')
validpgpkeys=('8B15186570664AF6494C3920B4767A17CEC5B4E9')
		#'993B7D7E8E413809828F0F29EB559C7C54DDD393')

#prepare() {
#  cd ${srcdir}/src

#  msg2 "Applying patches..."
#  patch -Np1 -i ../no_makeself.patch  # disable sfx archive
#}

#build() {
#  cd ${srcdir}/src

#  msg2 "Building veracrypt..."
#  export WX_CONFIG=/usr/bin/wx-config
#  make LFLAGS+="-ldl"
#}

package() {
#  cd ${srcdir}/src
  cd "${srcdir}"
  install -D -m755 "${srcdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/usr/share/veracrypt/doc/License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
  install -D -m644 "${srcdir}/usr/share/pixmaps/veracrypt.xpm" "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
  install -D -m644 "${srcdir}/usr/share/applications/veracrypt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
#  install -D -m755 Main/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
#  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
#  install -D -m644 Resources/Icons/VeraCrypt-48x48.xpm "${pkgdir}/usr/share/pixmaps/veracrypt.xpm"
#  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/License.txt"
}
