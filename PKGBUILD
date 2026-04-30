# Maintainer: Burgess Leo <liuxiaopeng731@gmail.com>
# Contributor: xianii jiyucheng007@gmail.com
pkgname=ass-shifter
pkgver=1.2.1
pkgrel=1
pkgdesc="Shift ASS format Subtitle"
arch=('x86_64')
url="https://github.com/Nigh/subtitle-ass-shifter"
license=('GPL-3.0')
source=(${pkgname}_${pkgver}-linux-amd64::https://github.com/Nigh/subtitle-ass-shifter/releases/download/v${pkgver}/${pkgname}-linux-amd64)
sha256sums=('3532e92e20cb4d4ff8b776cb9a7aabc9f599378a6aa9e0b95164baeebbf45d54')

prepare() {
  cd "$srcdir"
  # 使二进制文件可执行
  chmod +x "${pkgname}_${pkgver}-linux-amd64"
}

build() {
  true
}

check() {
  true
}

package() {
  cd "$srcdir"
  
  # 复制二进制文件到目标目录
  install -Dm755 "${pkgname}_${pkgver}-linux-amd64" "$pkgdir/usr/bin/${pkgname}"
}