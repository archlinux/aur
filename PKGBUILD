# Maintainer: aspen <aspenuwu@protonmail.com>
_commit=5d388e3c34ac21310b95d681108ac9990b241f43
pkgname=boardy-server-bin
pkgver=1
pkgrel=1
pkgdesc="Sync the clipboard with your PC! (Requires iOS tweak)"
arch=('x86_64')
url="https://github.com/Greg0109/BoardyServer"
depends=('xclip')
install="install.sh"
backup=('opt/boardy-server/ServerConfig.json')
source=("https://github.com/Greg0109/BoardyServer/raw/${_commit}/Linux/BoardyServer"
        "https://github.com/Greg0109/BoardyServer/raw/${_commit}/Linux/ServerConfig.json"
		"BoardyServer.service")
sha384sums=('2ba3401d5a4969f0d876c45b844b75e827ee444e91aa00100377686bf5ef13510ec5e512209ae055e8461e1b0041e060'
            '7740110f661793523bade5b9cd68ae4346b7de13585f2b2f124729d4b1a2ef83274c159b4f502008067ac311bc44a7a3'
            '814e530d1b6d63faa5432fe0df21d26a5d2415c651ebbc942723bd3dfbef29eff95d3e33dd50b55332ecae23a9f91111')
b2sums=('626ec0a617c5fcbd06c48f7435777092eddebd6ed7d13edc196b57e18e4170637ef07a671fd7f3d69e495f38310f104b28eb4a9805fc1b5e472771df72c9bf94'
        'ec17d54eb148eaeb28e1022234e4979aa47932c0ba9d744dd72294ced57626d13fd14558ad90c9d50f9594c2fc006caeb134a2d6fbc367a4a6360cacffb060a9'
        '581ed69e07ba61b04d17b2feebd422f53e02674c1830f75265e0f02df7d515fc354929308e7515d14339d0b917f87b21b1f46f25e667ce9367afb7aa30fa9278')

package() {
	install -Dm755 "$srcdir/BoardyServer"      "$pkgdir/opt/boardy-server/BoardyServer"
	install -Dm644 "$srcdir/ServerConfig.json" "$pkgdir/opt/boardy-server/ServerConfig.json"
	install -Dm644 "BoardyServer.service"      "$pkgdir/usr/lib/systemd/user/BoardyServer.service"
	chmod +x "$pkgdir/opt/boardy-server/BoardyServer"
}
