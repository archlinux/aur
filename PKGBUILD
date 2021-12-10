# Maintainer: Ayatale  <ayatale@qq.com>

pkgname=pplink-bin
pkgver=8.0
pkgrel=1
pkgdesc="帮助电脑、手机、平板等设备建立点到点的安全直连"
arch=('x86_64')
url="https://www.ppzhilian.com/"
license=('custom')
depends=('electron15')
provides=("pplink")
options=('!strip' 'emptydirs')

source=('https://relay.ppzhilian.com/download/PPZhilian_amd64.deb'
        'pplink'
        'pplink.png'
        'pplink.desktop')

sha256sums=('SKIP'
            '18631aa07dc4c1bf31583cc47bd658cf31e738bfa1b3814cecba28f31668fd71'
            'ce4819574e14cc722e8638965f160cc7b7eee03ee0be4aaf0d2e775c7f4f6e47'
            '9820b96114707dbf08b9666432212e7efa4bcc4635b8ba227878dff61e40eed2')

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
