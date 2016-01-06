# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=oczssdguru
pkgver=1.4.1992
pkgrel=1
pkgdesc="A GUI based tool for managing OCZ’s SSD’s including firmware and BIOS updates."
arch=('i686' 'x86_64')
url="http://ocz.com/ssd-guru"
license=('custom')
depends=('libxrender' 'libxext')
install=oczssdguru.install

if [ "$CARCH" == x86_64 ] ; then
  _bits=64
fi
if [ "$CARCH" == i686 ] ; then
  _bits=32
fi

source=("http://ocz.com/consumer/download/ssd-guru/SSDGuru_${pkgver}.tar.gz"
        "SSDGuru_polkit"
        "oczssdguru.png"
        "oczssdguru.desktop"
        "org.archlinux.pkexec.oczssdguru.policy")
md5sums=('cdaae461f5ed6d57d9906e59bae9c86a'
         'e25e656fc0264cb754394bc03dba261e'
         '5c04a46b8505846f61585216372d02bb'
         '054caff078ef6371b96a436993a9a4a5'
         '728991ff8eaaa9d323b794f9ee3956ff')
sha512sums=('cdbda98b8dba3641eb49528b4feeea7b6c1fd5087105956f771fcb52e341855051932d5fe2c0a88eeb90da19f24035570588ada79662ca1e8ca9664e8f7d71f5'
            'a8cc626ccf90c407c2686c815142d83489e2ab14e468011f6b35771979b99f913ff6c5a97761c50af21d80645d94b6e29cfa52f23efe4a53c7bc114be426ece4'
            '16936c5d9f018ed57e16565421ad9c3a248743f9e8eaeeac73e81524e6a34fe66843b86a23e045efeb1d48d9f0461ea555d050bdd7326329daddaddd0ef9c452'
            '124111b60da64afcef33c2d81add8f9b4a5edb9ba340880cbdfbb6224f7b378c7f2892c51311c22b258052fa41f208c8e51162f1d7886746db420c7054a14dca'
            '115abf03957f3da0d3f54f5bc340270d18cbbedaaaa2e7d23a16f54e9b4ac978b4c7e5a7ad83982cc5a4f5bf7f8f00b5c382d3a8b2ee196af621525d0866cf1b')

package() {
  install -D -m755 "${srcdir}/SSDGuru/linux${_bits}/SSDGuru" "${pkgdir}/usr/bin/SSDGuru"
  install -D -m755 "${srcdir}/SSDGuru_polkit" "${pkgdir}/usr/bin/SSDGuru_polkit"
  install -D -m644 "${srcdir}/oczssdguru.png" "${pkgdir}/usr/share/icons/oczssdguru.png"
  install -D -m644 "${srcdir}/oczssdguru.desktop" "${pkgdir}/usr/share/applications/oczssdguru.desktop"
  install -D -m644 "${srcdir}/org.archlinux.pkexec.oczssdguru.policy" "${pkgdir}/usr/share/polkit-1/actions/org.archlinux.pkexec.oczssdguru.policy"
  install -D -m644 "${srcdir}/SSDGuru/EULA.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/EULA.rtf"
}
