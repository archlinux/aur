# Contributor: Barfin
# Maintainer: Vyacheslav Razykov <v.razykov@gmail.com>

pkgname=outline-client-appimage
pkgver=1.13.1
pkgrel=2
pkgdesc="The Outline clients use the popular Shadowsocks protocol, and lean on the Cordova and Electron frameworks."
arch=(x86_64)
conflicts=('outline-client-appimage-wayland' 'outline-client-appimage-git')
url="https://getoutline.org"
license=("Apache License 2.0")
source=("Outline-Client_${pkgver}.AppImage::https://s3.amazonaws.com/outline-releases/client/linux/stable/Outline-Client.AppImage"
        "outline-client16.png"
        "outline-client24.png"
        "outline-client32.png"
        "outline-client48.png"
        "outline-client64.png"
        "outline-client128.png"
        "outline-client256.png"
        "outline-client512.png"
        "outline-client1024.png"
        "outline-client.desktop"
        "outline-client-appimage.install")
options=('!strip' '!debug')
depends=('fuse2' 'nss')
install=${pkgname}.install

package() {
  install -Dm755 "${srcdir}/Outline-Client_${pkgver}.AppImage" "${pkgdir}/opt/outline-client/Outline-Client.AppImage"
  install -Dm644 "${srcdir}/outline-client.desktop" "${pkgdir}/usr/share/applications/outline-client.desktop"
  install -Dm644 "${srcdir}/outline-client16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client24.png" "${pkgdir}/usr/share/icons/hicolor/24x24/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/outline-client.png"
  install -Dm644 "${srcdir}/outline-client1024.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/outline-client.png"
  mkdir --parents "${pkgdir}/usr/bin/"
  ln --symbolic "/opt/outline-client/Outline-Client.AppImage" "${pkgdir}/usr/bin/outline-client"
  ln --symbolic "/usr/bin/core_perl/shasum" "${pkgdir}/usr/bin/shasum"
}

sha512sums=('5a3aa5c08f1f89dab6839f462ea90e65cd8278bed7ac34deea3d2e0a5330dd54c6ae9cb2e4d418b18f8effdfb3c1a48c0db4d61c07cc48dbaecf3c4da68ad181'
            '0ab53d79d50c5f298a7756f33419f7ad69647b3b520df298bc8a6dea4f645b7f945e8b4019fe72123244e69848b4b982691a0d612e98ed0253997c84bf0f896e'
            '32111c56f40bef561c905abb97f60269b3e6389506ae56a917858537d4a74e1e14675fb7aa77248d583c386406bdc3f974e1410454dfccb0cab5ad51efbd94ba'
            'cd4d85f2e042cd72cc9718dfb3930809463e8bc7ab3cf6c9cd10193e659d40cc830e858a2c266fa1c28ca9559f1c1c7b9a60837d647974f03ac9fe5c0bdc921a'
            '616db62f15601edd4741578cca1515e8f9575904621b3055c938155d85edc9255773fb9be47cecd1c4c67a0c100e1235262ea6cb4c05c1e6d62f796148929d25'
            '3783b13ff01b69e31e8bd5a70d876d0b04bd2850688c6617933c0335076f23a5c7b846377c2cb59757fa83dd3b4d17c188f436a2554fa49917e41478ff2a3619'
            '4ec773d6ef7ed6350bc140ea60ba116f4e9518f79283c13dbde2b2aa2ccd88d4856fd539723db18e07e02ab3c2f2c80b5b5d6429dc14717cc356f25ba391b14f'
            '1b6e24e90089c8bd957049986aa3a2eba1553439bbccb4bc3d3b8e877b2bc34c8ae66b4770516f0c4f6b704e451c992b87d6a94f141d8c1c80074054fcb109f5'
            'dce6e91b82b0d6f0cccb6420c8ba1be81cd15a00ef3be81e3a16dbc00722e50dd788b39be772a304799fad7047b7981e8c0062d3952b9fc925239a7a7caa79e0'
            '91eecbad43ecfe3d1573a4dfc82726185f6125ccbf03cb3314eabc9caaff87cdee6271ed8b23975122e630a229b436db559b428addbf273ba588d719df756614'
            'ac27c3fb1768407614fb01252603c7a42968623c617aef40d0d9dca1eda19561ba742846f37245a3eee8e2571d43dc5f17a95b19ad427ca216c86c87907db5a6'
            'a1704e707b0b0a927fae068647eccb426bb51ad2081d27ee18e8991949e9135d28fe502d1a1dba27d333025edd235614b195758d14be2d0eeb97172bea851ddd')
