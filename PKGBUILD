# Contributor: grimi <grimi at poczta dot fm>

pkgname=mime-archpkg
pkgver=0.3.6.4
pkgrel=1
pkgdesc="mime type for archlinux packages"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
depends=('shared-mime-info' 'gtk-update-icon-cache' 'librsvg' 'imagemagick')
install=${pkgname}.install
source=(${pkgname}.{xml,sh} {hicolor,gnome,Tango,oxygen,nuoveXT2,Faenza,Faience,NITRUX,Numix,breeze,FaenzaFlattr2-Zephyr,elementary}.svgz
        {install,update,remove}.hook hook-script.sh)
sha256sums=('e3fc45b1121fa845a245c115704715ec0b6a17860a507202cc5e1b02d01c797b'
            '9b3418ba5cb6acf32ea63bb9868554efcc0375b1f60aa8f244be38174c4f004c'
            'fc9b1f43e5993e994707285d89e0da28be48b69046f4cac68578a8d0beef4653'
            'a59eb69c6fcdf7e8017c2596384cff0635dee46e3db5949370de766273451a85'
            '0a4951fd15afb85229ee17629686f914b5e5ed0583846dde2350e0c247007975'
            '1249231b458fad9901e8958e1bcaa119a79bbab0303ff7eaa27ad52c4ae5a77c'
            '4b9d0454dc82bf6475b70aaee1733236ef78afe821467a60080ddeaf3c13d9c2'
            '2e475b3ce9bcf96510e83748eaa45b918eded89278f232570b5eb558c5fbb4fa'
            '7739338376904d9d93e5aa7a678b7da8314cb3022e4bc6938af6353cd4e9e300'
            '52c6986309a98e0c85ad717c867d9d9a4772ce36c3d5d5ad94dda6fb23b5c749'
            'a26a86877f36d7ba61851659871ce6461a86b3004d3270b465931a611b64e0ef'
            '8af276bc4afecede207a6742a5ef9320155650364339af183f9d47e1614c30a7'
            '3f0177c13377ad94745ec0f0324ab5fb58eeccac4e4b56695ac0f2113fb4d5bb'
            'a99c2b48796d6f8299867034242c69fbddef4c380df0b68a678ee2727c841f29'
            '814ec6d8b1318ffde6732c6ba468d66bc32534e79e486e4a4aaace0147b00d22'
            '372f44c4e8d5d9dcca7cf80bd2e2b8ef3874aad6f6051073f4e98839dd9ed531'
            '622ee32d6ddbcb46671dcc46c7b31f4b7d9d4083e416af0100ab4bcc9829bd06'
            '2c553f584aa0be02e5d62bc1b7af005b963124dba8987af9b13c5fbd8707fb2f')


package() {
  install -Dm644 ${pkgname}.xml "${pkgdir}"/usr/share/mime/packages/archpkg.xml
  install -Dm755 ${pkgname}.sh "${pkgdir}"/usr/bin/${pkgname}
  install -d "${pkgdir}"/usr/share/${pkgname}
  install -m644 *.svgz "${pkgdir}"/usr/share/${pkgname}/
  install -Dm755 hook-script.sh "${pkgdir}"/usr/share/libalpm/scripts/${pkgname}
  install -Dm644 install.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}-install.hook
  install -Dm644 update.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}-update.hook
  install -Dm644 remove.hook "${pkgdir}"/usr/share/libalpm/hooks/${pkgname}-remove.hook
}


# vim: set et sts=2 sw=2 ts=2 :

