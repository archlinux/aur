# Maintainer: Christoph Liebender <@churisotophu:matrix.org>

pkgname=openasar-bin
_pkgname=OpenAsar
pkgver=20221010154340
_pkgver=nightly
pkgrel=7
epoch=3
pkgdesc="Open-source alternative of Discord desktop's app.asar, needs Discord installed"
arch=('x86_64')
url="https://openasar.dev/"
license=('MIT')
depends=('unzip')
optdepends=('discord: Stable channel Discord'
            'discord-ptb: Public test channel Discord'
            'discord-canary: Canary channel Discord'
            'discord-development: Development channel Discord')
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
        "openasar-canary-electron.hook"
        "openasar-ptb.hook")
sha512sums=(SKIP
            '9e920a15880afae09536db2ee983cf96c4300f5f7a9764323bbf0ca47ad25d1f27085bee9c0ecd4001f17e0e34f9e2e5140351802572cb9066a5d453e1a7897d'
            '36b20ed4a22c7bd093c3ab1aaf6206061bec9d543551684e6fdb46ba6fedc28bc93da5185d22e8b637711f9fed45614793da69e3d07744d378b77380a9aec849'
            '6702f6ba99197260ee0ecf38229a0989a8fa439c8afe9e75548bfe01bc2ab0e010b1e72eb0a8a3af265d122c62243ec2a6b5ad0fcdab3fc3a8b3777150fa72a4'
            'caec18d895181d89aa6294e72c3ff25291e1fb3b580521e95b7c0b8dc9f81708cd1ae80871de14055cda7b881015e30b11f97b3d9f43299e5ba464c07eb06461'
            'c2db611300d29650bf2a66e8745722fa88464434da1bd5b8d8abf26ad6281045ef6c474de7e05d558fcab8928b93ebed83ee49390054bd331f832215632b4b69'
            'da43ebfc6900a547b74d51f9035cc6ab80d0a1eefd9257a7036a11765771246bcc528e5c50c8d1e2aa4f1a06fcc641c2111004aba311d38c9bad21855064c951'
            '5094de305fbf70f2a79e88b0dd0ee55a85a23c333da7b681b0262896a5503a7b7b7c7bb0b52d9be60003e78a3b33b88c3e586ecc0d450c64dbc90d460efd2323'
            '3ca8d2adad92dc01e98bb8c0fa1216d946a661274bc30a5ae639f903c7d489bb7bee83db3cd0d8d79bfd31e58c1c608998b566c7d069323ed6c95483522c0d89'
            '06fdb8c0b3d4a1b7a25d492b5475f04240321ddcb4c1b6bd7195b40be7a049295f5727d8c6432c3d140822a01640399e9bb8bbfd5e7b076af97be54d08060a36'
            'f8239a0db540066071fa7bdc887d87fc3183a7c0c2d05385f00ff9d97717f99c5bd954174e3127b1449cc20795ba3eec779d53c257e517e7dcc06b15553eff8b'
            'cb675443e58e8bbfe9d4028c9f611c9b756dc5b3b50b856cd2f26a7668668c127d36f862dd2d0c6b241964c31eea69bc6175e1215de80bbd8ad471c64d5ba6d8')
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
