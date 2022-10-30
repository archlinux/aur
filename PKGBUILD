# Maintainer: Christoph Liebender <@churisotophu:matrix.org>

pkgname=openasar-bin
_pkgname=OpenAsar
pkgver=20221010154340
_pkgver=nightly
pkgrel=3
epoch=3
pkgdesc="Open-source alternative of Discord desktop's app.asar, needs Discord installed"
arch=('x86_64')
url="https://openasar.dev/"
license=('MIT')
depends=('unzip')
optdepends=('discord: Stable channel Discord'
            'discord-canary: Canary channel Discord'
            'discord-development: Development channel Discord'
            'discord-canary-electron-bin: Canary channel Discord using system provided electron')
conflicts=('discord_arch_electron')
source=(""$pkgver".asar::https://github.com/GooseMod/$_pkgname/releases/download/$_pkgver/app.asar"
        "openasar-install.hook"
        "openasar-install.sh"
        "openasar-remove.hook"
        "openasar-remove.sh"
        "openasar-update.hook"
        "openasar-canary.hook"
        "openasar-development.hook"
        "openasar-stable.hook"
        "openasar-delete.sh"
        "openasar-canary-electron.hook")
sha512sums=(SKIP
            '10065869fa71679d371dd2437b424ceb84c7b042f45d158402284820bfcd27ab30019303649b4c2ffc55f96634ce7bdb2efc459f94fa7c33594bad20454f0c46'
            '07fdb26b9e7963fee1a8b201a0014804033a5a9a9d86f32edd120aa42d70c36b8f08353e261a84d793ccbd067dd770738d5f923e0dac994ffc02a206987abd45'
            '6702f6ba99197260ee0ecf38229a0989a8fa439c8afe9e75548bfe01bc2ab0e010b1e72eb0a8a3af265d122c62243ec2a6b5ad0fcdab3fc3a8b3777150fa72a4'
            'ccece676a111fe23b200c3f1f1a40ce3ef268f7ce60e33d858f971be7b289aeb8f9ad6c5ffe4bbc3cf428bb5c22317d684b342f99287b359b6f4fa7253042be3'
            'e867aefb61b7f34bdd9f545713d2ba45cb6f20dba4570740c886c6e8a406a0ecd2f247c0bc3493ce803b23d3d93a01fddbf4441fbb50d5e81b25a0c78e157ead'
            'da43ebfc6900a547b74d51f9035cc6ab80d0a1eefd9257a7036a11765771246bcc528e5c50c8d1e2aa4f1a06fcc641c2111004aba311d38c9bad21855064c951'
            '5094de305fbf70f2a79e88b0dd0ee55a85a23c333da7b681b0262896a5503a7b7b7c7bb0b52d9be60003e78a3b33b88c3e586ecc0d450c64dbc90d460efd2323'
            '3ca8d2adad92dc01e98bb8c0fa1216d946a661274bc30a5ae639f903c7d489bb7bee83db3cd0d8d79bfd31e58c1c608998b566c7d069323ed6c95483522c0d89'
            '06fdb8c0b3d4a1b7a25d492b5475f04240321ddcb4c1b6bd7195b40be7a049295f5727d8c6432c3d140822a01640399e9bb8bbfd5e7b076af97be54d08060a36'
            'f8239a0db540066071fa7bdc887d87fc3183a7c0c2d05385f00ff9d97717f99c5bd954174e3127b1449cc20795ba3eec779d53c257e517e7dcc06b15553eff8b')
pkgver() {
  curl -sS https://api.github.com/repos/GooseMod/OpenAsar/releases | grep published_at |head -n 2| sed 1d | sed 's/[^0-9]*//g'
}

package() {
install -Dm 644 "$pkgver".asar "$pkgdir"/usr/share/openasar/app.asar
install -Dm 644 openasar-install.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-install.hook
install -Dm 744 openasar-install.sh "$pkgdir"/usr/share/openasar/openasar-install.sh
install -Dm 644 openasar-remove.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-remove.hook
install -Dm 744 openasar-remove.sh "$pkgdir"/usr/share/openasar/openasar-remove.sh
install -Dm 644 openasar-update.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-update.hook
install -Dm 644 openasar-canary.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-canary.hook
install -Dm 644 openasar-development.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-development.hook
install -Dm 644 openasar-stable.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-stable.hook
install -Dm 744 openasar-delete.sh "$pkgdir"/usr/share/openasar/openasar-delete.sh
install -Dm 644 openasar-canary-electron.hook "$pkgdir"/usr/share/libalpm/hooks/openasar-canary-electron.hook
}
