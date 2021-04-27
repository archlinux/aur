# Maintainer: Aaron Fischer <mail@aaron-fischer.net>

pkgname=hmap2
pkgver=20121222
pkgrel=2
pkgdesc="BSP compile tools for Quake 1"
arch=(i686 x86_64)
license=("GPL")
url="https://icculus.org/twilight/darkplaces/index.html"
source=("https://icculus.org/twilight/darkplaces/files/${pkgname}build${pkgver}.zip"
        "verbose-redeclared.patch")
sha512sums=("188efbe3d7061ecdc8184e372b9f3c4bfa4047f01666a69db9effd3d46506a5b29632f29e954951a8d03fa186a4c7d66af90a2dc1d925f91a68d9cb0e4c44b9f"
            "3380dab8f5c7d87e09516affc6a1715173cfc34887edab6fcaee8da5a5cb47c97751989277e76ac667e48ad2489c550a6d72b2d6f016b702c5dd281a5dfb629d")

prepare() {
  patch --forward --strip=1 --input="../verbose-redeclared.patch"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm777 hmap2 "${pkgdir}/usr/bin/hmap2"
}
