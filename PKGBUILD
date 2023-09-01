# Maintainer: Geeko <sheepsull@gmail.com>

pkgname=betterspades
pkgver=0.1.5
pkgrel=2
pkgdesc="Opensource game client for Ace Of Spades 0.75 protocol"
arch=('i686' 'x86_64')
url='https://github.com/xtreme8000/betterspades/'
license=('GPL3')
depends=('hicolor-icon-theme' 'openal' 'glfw' 'enet' 'glew')
makedepends=('glfw' 'libdeflate' 'enet' 'cmake' 'unzip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xtreme8000/$pkgname/archive/v${pkgver}.tar.gz"
        "http://aos.party/bsresources.zip"
        "$pkgname.desktop"
        "$pkgname"
	"hashtable.c"
	"hashtable.h"
	"microui.c"
	"microui.h"
        "dr_wav.h"
        "http.h"
        "ini.c"
        "ini.h"
        "libdeflate.h"
        "lodepng.cpp"
        "lodepng.h"
        "log.c"
        "log.h"
        "parson.c"
        "parson.h"
        "stb_truetype.h")
sha512sums=('743c66f620be0e15a4b9055ba0e1709fcec6e7152836f4c87ad6545cd2b03fc14691b523b196608c5a62e7774f272227b3b7bc436445e5205549b55cb5284ceb'
            '83651b4befe06b534299fac03de032466f20ab8010bcb0828e8f67594865726437b527334fd3f048b5ae1939ad0e4d02bf8fd5cff2e23afba7d6e644dd6f5fa7'
            '45488d7196410a1bc9461de82ac28ac5335cb99babae5f8a4465539b196a4cbe9361aa1f8d7521289537aae6fdb2a8c5c2588b20f4fd5fe7c4484f9c9c8e285b'
            '5cac9e619faa2d83a3db76753b9bbea40d3c97de579701357d6d6472feb378bb4dca1ba389b132ae6187b0a15b2bc17d42fba331e0c653682827d09af0e231aa'
            '44eb971c90986186b2c532fde9c40ec4f61bc6f1c97b4424cd074c29d7b98fe43cb973dae7b89c9587fcf06c0816b93e9dddc92e97c9771f1cec8f0fea73c79c'
            '171d84c3f3076f62f1630141f85f662a543d2eb46267cc4dc2e80711cc59a0408cabc31372223993543bf621876657a519909e79e381a62a6ada0857d0473e46'
            '3f4012212805c5ef72f6cf552ae50200afb640f5062d64795ed383918dcb8b7f9e0579dc93b17a7abe2c9d4cc579539b247c628b52a92d257f06e4d16e8f3975'
            '6b978b8039cb05ff0dbde66ba1da4c20e89be45cd9d186b9822fabe040715259bc317b38fbc8d5c3a82a8dd1011fb807be47a4e4d76e658095f9340149c20255'
            'a4a681546716b1a1a9e55321796828828b1872bf223c7c02529a1553b8beafe2a89ffe72a38e5aa3bf457a8ce4dd2dcf9cba7a9cde28e59586a8388f1439a8a1'
            '8ec9a4dfb877bc5619328cc74f11f96d212397acf25b267e10d51d9ee8ad9a1993c2ceb8ebe60d9aec82071a9307d467001ddcc78146a7c62030298a979d2fbe'
            '065534de4e0a759c3f9f10982faa2cb73d6df1d7cf8b517216b8b702039757fe2274fd8c896a28bf2d3a450f41584683ddbd39e6185422def33e9c2bbf1cde9d'
            '2ee3b47f7dd9480660fb3e50d5ea8f5487a7b1edc76982a1792c22340b61d21e52d1b25c04a62ce26e9dccaf85d695182f4473ebb92c1bd5d0b747a6c678acd2'
            '040a051466f9181da144319c36ce01d356fc19a3c9a5ae98e505bb80f59e4338fc04891292f181734a6ea7fc98765c6ff1df972e7a834bd1bcc069be31e3fd08'
            'b3d84154da5006359149efa152ba45e5c7840c1bacb84fda2aec3a098160c5e92cf5e663bba1751efa900b33088638317c23a4aae9d20f8708ab3f241476dd1c'
            '343509db4ff7abe4d5cfe35e08ed8ac6d951b2fb9074fc6fc44089525ba1989d6ab576c3457e4fd55583c23c0cbaee13e6ef94836c68fe7164558ad26b4cb217'
            'f554243f4f681fdefa5721870b0448e873d61e2a6cd0b33acfd032adfdaca21f1b7071f736f079cf003c32915689793737d619949c2338ad246b26cc1d66ef7b'
            '646cc47eabec416e981e1544dc58778873f9727e7dd8903d4f577c21f5e86df5eea938b8aee23ea2bbf5ac709199eedbfde3729bc1734ad4fc28a9510edb4804'
            '419f63f73191a950ceb1bea79c7d1a7fecab1f79e1e71d4eef5a5403a04cdb015b8d9318f28abad46f6fe0b827f8d69430f93d5e809bb6adaefae3011278d248'
            '8708a630bf222183308bf816a7286ae0253de7ce45ace1eafe7eb12c64ebceff6ad34e96b0be9cffa3eccf0f3c39d864bd7f0e518227e35b71325b94c088b8e6'
            'ad92035b7a9ac07ab25a040d38b3a975c6c6c0ce65bb39fe1f2b8ac6208bfab066f2ae032e0736116ca61ff2c174acab794d504ae72284a109e8ce6f27790189')

prepare() {
	cd BetterSpades-${pkgver}
	mkdir -p src/lodepng/
	cp -v $srcdir/dr_wav.h src/dr_wav.c
	cp -v $srcdir/hashtable.* src/
	cp -v $srcdir/http.h src/
	cp -v $srcdir/ini.* src/
	cp -v $srcdir/libdeflate.h deps/
	cp -v $srcdir/lodepng.cpp src/lodepng/lodepng.c 
	cp -v $srcdir/lodepng.h src/lodepng/lodepng.h
	cp -v $srcdir/log.* src/
	cp -v $srcdir/microui.* src/
	cp -v $srcdir/parson.* src/
	cp -v $srcdir/stb_truetype.h src/
}

build() {
	cd $srcdir/BetterSpades-${pkgver}

    	[[ -d build ]] && rm -rf build
    	mkdir build && cd build

	cmake ..
	make
	cp -v $srcdir/bsresources.zip bin/
	cd bin
	unzip -u bsresources.zip
	rm bsresources.zip
}

package() {
	cd $srcdir/BetterSpades-${pkgver}/build/bin
	install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
	install -Dm644 "icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
	rm icon.png
	install -d "$pkgdir/opt/$pkgname"
	cp -a "$srcdir/BetterSpades-${pkgver}-beta/build/bin/." "$pkgdir/opt/$pkgname"
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 "$srcdir/BetterSpades-${pkgver}-beta/LICENSE" "$pkgdir/usr/share/doc/$pkgname/LICENSE"
	install -Dm644 "$srcdir/BetterSpades-${pkgver}-beta/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
	# Moving cache and config files to home dir to avoid crashes
	rm -rf "$pkgdir/opt/$pkgname/cache"
	ln -sf "/tmp/$pkgname/cache" "$pkgdir/opt/$pkgname/cache"
	ln -sf "/tmp/$pkgname/config.ini" "$pkgdir/opt/$pkgname/config.ini"
}
