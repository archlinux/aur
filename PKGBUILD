# Maintainer: Dae Euhwa <daedaevibin@ik.me>

pkgname=ddsc-bin
pkgver=1.5.0
pkgrel=1
pkgdesc="Dynamic Discord Rich Presence based on active COSMIC windows"
arch=('x86_64')
url="https://github.com/Veridian-Zenith/DDS"
license=('MIT')
depends=('glibc')
provides=('ddsc')
conflicts=('ddsc' 'ddsc-git')
source=("$url/releases/download/v$pkgver/ddsc"
        "$url/raw/v$pkgver/scripts/discord-monitor.sh"
        "$url/raw/v$pkgver/scripts/discord-monitor-cosmic.service"
        "$url/raw/v$pkgver/common/src/config/default-config-cosmic.json"
        "$url/raw/v$pkgver/cosmic/autostart/ddsc.desktop"
        "$url/raw/v$pkgver/LICENSE")
b2sums=('dadc5b15d117e5ac657cf56d6f6779eb1aef8b2a20eccaaae2419cda273f684b20949a0f1956fe4e8a70125533053579e90250bd0239c8af0bcea52760d2bfa4'
        'df9740ba0092e81bfbaffaff3c97228e3f68b1a723edf14ca5461b434d414e54e0ff26fff6eed2c8710a6d10212f4fe92ba6b20cec4c8771a95d6426bff29cfc'
        '259ada6a1cc30822563da55dc69abee6a5e4d6d13f794e1fea4cdfec3df886645b2de6806a6faaf27384f2b780a4f313f5ff56d23d9db5637150410f4e113175'
        'ba78e4bb31ba897cf525cfe6af479938df8e1da647dace2d58f73204db34433a0e0c500743d016f75022d2ed0f58bc2896a831964742966ab21728bd1b757beb'
        'cea3a4b42cb07c90e34e7d542a391af776c67c442cd5c39d6c800e8b39aca360e2e8a1ddcdf153574692703d66c09cba911b86c568bdfab79b1962af5241f81c'
        '11c850dfc0f33a4050e87a982ffacaa90f175c442a77fff59ea7c7859807676552cc8d981c9c97537377782b6538a9fa6c0ca7ddffce77dfd2d98824e62f483b')

package() {
    install -Dm755 "$srcdir/ddsc" -t "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/discord-monitor.sh" "$pkgdir/usr/bin/discord-monitor-ddsc.sh"
    install -Dm644 "$srcdir/discord-monitor-cosmic.service" -t "$pkgdir/usr/lib/systemd/user/"
    install -Dm644 "$srcdir/default-config-cosmic.json" "$pkgdir/usr/share/ddsc/config.json"
    install -Dm644 "$srcdir/ddsc.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
