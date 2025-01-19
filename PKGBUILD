# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=neuralnote-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Neural Note standalone release. Audio Plugin for Audio to MIDI transcription using deep learning."
arch=('x86_64')
url="https://github.com/DamRsn/NeuralNote"
license=('Apache-2.0')
source=("https://github.com/DamRsn/NeuralNote/releases/download/v${pkgver}/NeuralNote_Standalone_Linux.zip")
sha256sums=('d74166ed126fe583275578c5e7331c4823ffb8c3fe4bc6f2c7ca56ac93ef3841')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    unzip "$srcdir/NeuralNote_Standalone_Linux.zip"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    # 创建目标目录
    install -dm755 "$pkgdir/usr/bin"
    
    # 使用一个 install 命令将 NeuralNote 二进制文件安装到 /usr/bin/
    install -m755 NeuralNote "$pkgdir/usr/bin/NeuralNote"
    
}
