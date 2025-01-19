# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=neuralnote-vst3
pkgver=1.1.0
pkgrel=1
pkgdesc="Neuralnote vst3 release. Audio Plugin for Audio to MIDI transcription using deep learning."
arch=('x86_64')
url="https://github.com/DamRsn/NeuralNote"
license=('Apache-2.0')
source=("https://github.com/DamRsn/NeuralNote/releases/download/v${pkgver}/NeuralNote_VST3_Linux.zip")
sha256sums=('0c2c1fa2a407d69a0151bb5f16187f0626867c1c2f97a456567eb24faa60951c')

prepare() {
    mkdir -p "$srcdir/$pkgname-$pkgver"
    cd "$srcdir/$pkgname-$pkgver"
    unzip "$srcdir/NeuralNote_VST3_Linux.zip"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    
    install -dm755 "$pkgdir/usr/lib/vst3"
    cp -r NeuralNote.vst3 "$pkgdir/usr/lib/vst3/"
}
