# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=pplink-bin
pkgver=6.5
pkgrel=2
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com/"
license=('custom')
depends=('electron')
provides=("pplink")
options=('!strip' 'emptydirs')

source=('https://relay.ppzhilian.com/download/PPZhilian_amd64.deb'
        'pplink'
        'pplink.png'
        'pplink.desktop')

md5sums=('SKIP'
         '400124e147dd8f37cf4f27a0aa9f2805'
         '42cdee25421b4a84c117228e3f1d868d'
         'fb027a0085e615613be9617d533938b9')

prepare() {
    tar -xf ${srcdir}/data.tar.xz -C ${srcdir}
}

package() {
    install -Dm755 "pplink" "${pkgdir}/usr/bin/pplink"
    install -Dm644 -t "${pkgdir}/usr/share/applications" "pplink.desktop"
    install -Dm644 "pplink.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pplink.png"
    install -Dm644 "opt/pp直连/resources/app.asar" "${pkgdir}/usr/share/pplink/app.asar"
    cp -r "opt/pp直连/resources/app.asar.unpacked" "${pkgdir}/usr/share/pplink/"
    cp -r "opt/pp直连/resources/aria2" "${pkgdir}/usr/share/pplink/"
}
