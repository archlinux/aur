# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=sabnzbd-desktop
pkgver=1.0
pkgrel=1
pkgdesc='Desktop tools for sabnzbd.'
arch=('any')
license=('GPL')

optdepends=('sabnzbd: usenet downloader')

install='sabnzbd.install'

source=('sabnzbd.desktop'
        'sabnzbd.confd'
        'addnzb.sh'
        'nzb.png'
        'sabnzbd.png'
        'x-nzb.xml')

sha256sums=('887f93942b78c0475009b1ce84b502c28e273c222451a4736cd4c37ff5454f04'
            '8462203454d488b5d4f7beb85e61da2efa42d3dffa465f3bf16a95abe0bc7c0a'
            '30ffff8b9c00e91358cd6c5dca89f9d9f8f12843e7b3c44c6d5b0f09b0ea424a'
            'ef8f4fb1a3a0750c74b7addd302ab8733187ad370b5d27336afb2677d7154571'
            'fce3e065d017ce3bc4548a766f25c95f982af4f6085263c72f3000f49d810409'
            'f53261d7578c67fb9fd6a639df94cd53604bcf37b9b03a926cb03e5214b496fe')

package() {
  mkdir -p "${pkgdir}/usr/lib/sabnzbd-desktop"
  install -D -m 644 "${srcdir}/sabnzbd.confd" "${pkgdir}/etc/conf.d/sabnzbd"
  install -D -m 755 "${srcdir}/sabnzbd.desktop" "${pkgdir}/usr/share/applications/sabnzbd.desktop"
  install -D -m 755 "${srcdir}/addnzb.sh"    "${pkgdir}/usr/lib/sabnzbd-desktop/addnzb.sh"
  install -D -m 644 "${srcdir}/nzb.png"    "${pkgdir}/usr/lib/sabnzbd-desktop/nzb.png"
  install -D -m 644 "${srcdir}/sabnzbd.png"  "${pkgdir}/usr/lib/sabnzbd-desktop/sabnzbd.png"
  install -D -m 770 "${srcdir}/x-nzb.xml"    "${pkgdir}/usr/lib/sabnzbd-desktop/x-nzb.xml"
}
