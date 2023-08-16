# Maintainer: Natsuhane-Ayari <tom3451617@gmail.com>
pkgname=unnamed-sdvx-clone-bin
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="A game based on KShootMania and SDVX."
arch=('x86_64')
url="https://github.com/Natsuhane-Ayari/unnamed-sdvx-clone"
license=('MIT')
groups=()
depends=('dialog' 'curl' 'unzip')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Natsuhane-Ayari/unnamed-sdvx-clone/releases/download/v0.5.0-2/usc-game-v0.5.0.tar.gz"
		"usc-game.desktop"
		"usc-dlcha"
		"usc5.png"
		"usc-game.sh")
noextract=()
sha256sums=('de81cf5b1a6b778e15a9f74c09f834ae611d75497659c4b1636e622adeb340df'
            '39174a856b8954be05972f23b26c358327ae0e79a1290132c0f4636797af764e'
            '7a37acae3821ab89f6ca197386c0d054553cbc1808f65d3482b4d3750bdad397'
            'bcba5233cb370fd5936ef4c575684ddca265e9ecbbf90a2703ecb7bb6d793c24'
            'b2feeefa6d7c8d7270b34b57e6b3304e50e9b82c21e068d0f7d773dd4d2d31e9')
validpgpkeys=()



package() {
	mkdir -p ${srcdir}/usc-game-v0.5.0/bin/songs/nautica
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/opt/usc-game-v0.5.0
	mkdir -p ${pkgdir}/usr/share/applications
	mkdir "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	cp -r ${srcdir}/usc-game-v0.5.0/ ${pkgdir}/opt
	cp ${srcdir}/usc5.png ${pkgdir}/opt/usc-game-v0.5.0/bin
	cp ${srcdir}/usc-game.sh ${pkgdir}/opt/usc-game-v0.5.0/usc-game.sh
	cp ${srcdir}/usc-dlcha ${pkgdir}/usr/bin/usc-dlcha
	install -Dm644 ${srcdir}/usc-game.desktop -t $pkgdir/usr/share/applications/
	chmod a+w ${pkgdir}/opt/usc-game-v0.5.0 -R
	ln -s /opt/usc-game-v0.5.0/usc-game.sh ${pkgdir}/usr/bin/usc-game
}
