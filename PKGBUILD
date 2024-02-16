# Maintainer: BadBoy <luckmelove2@gmail.com>

pkgname='kgm-decoder'
pkgver='0.1'
pkgrel='0'
pkgdesc='一个将酷狗缓存歌曲文件和下载的单曲收费歌曲文件转码为 MP3 的工具。'
arch=('any')
license=('Anti 996')
url='https://github.com/ghtz08/kuguo-kgm-decoder'
makedepends=('rust')

source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/kuguo-${pkgname}"
    cargo build --release
}


package() {
    install -Dm755 "${srcdir}/kuguo-${pkgname}/target/release/${pkgname}" -t "${pkgdir}/usr/local/bin"
}
