# Maintainer alx365 
pkgname='noisetorch'
pkgbase='noisetorch'
pkgdesc='Real-time microphone noise suppression on Linux.'
pkgver='1.0'
pkgrel='1'
arch=('any')
url=https://github.com/lawl/NoiseTorch
license=('GPL3')
depends=('pulseaudio')
makedepends=('go' 'cmake')
md5sums=('SKIP')
source=('git+https://github.com/lawl/NoiseTorch.git')

build() {
	pwd
	cd NoiseTorch
	pwd
	git submodule init
	git submodule update
	go run scripts/signer.go -g
	pwd
	#cd ..
	make release
	
}

package() {
	pwd
	cd NoiseTorch/bin
	tar -C $HOME -xzf NoiseTorch_x64.tgz
	echo "currently you can't use the audo updater. Because you compiled it from source." 
}
