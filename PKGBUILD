# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=auth-thu-bin
pkgver=2.2
pkgrel=2
provides=('auth-thu')
conflicts=('auth-thu')
pkgdesc='A commandline Tunet (auth4/6.tsinghua.edu.cn, Tsinghua-IPv4) authentication tool'
arch=('x86_64')
url='https://github.com/z4yx/GoAuthing'
license=('GPL3')
source=(
  "$pkgname-$pkgver::https://github.com/z4yx/GoAuthing/releases/download/v$pkgver/auth-thu.linux.x86_64"
  "https://github.com/z4yx/GoAuthing/raw/v$pkgver/docs/goauthing.service"
  "https://github.com/z4yx/GoAuthing/raw/v$pkgver/docs/goauthing6.service"
  "https://github.com/z4yx/GoAuthing/raw/v$pkgver/docs/goauthing6@.service"
  "https://github.com/z4yx/GoAuthing/raw/v$pkgver/docs/goauthing@.service"
)
sha256sums=('24718658254c5c88da21b1e156c3b9d58a635690bc68ffef9b9e446bffc97a93'
            'cfef26f4e2bf6aa336713372f7e015c477da0c1c976e6a609a0398ddbc710e16'
            'c78e6168e14cb41f294f3b9632c38a48a1522e50c8d94ff7de8abe70e8b3e644'
            'c97cfda5a20d7b1f52e0ca003567f2671aea9142ec4932cae74ffa89d0b0e093'
            '177bad4c4af6479b710510da57803ae536ad5079f73aae493071adefa49c3d8f')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/auth-thu"
    sed -i "s|/usr/local/bin/auth-thu|/usr/bin/auth-thu|g" goauthing*.service
    install -Dm644 goauthing*.service -t "$pkgdir/usr/lib/systemd/user"
}
