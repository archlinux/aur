# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=minecraft-ipv6
pkgver=1.0.0
pkgrel=1
pkgdesc="A wrapper for the minecraft that does not disable IPv6"
arch=(any)
url="https://bugs.mojang.com/browse/MC-3776?focusedCommentId=163693&page=com.atlassian.jira.plugin.system.issuetabpanels:comment-tabpanel#comment-163693"
license=('BSD')
depends=('minecraft')
source=(MinecraftIPv6.java minecraft-ipv6.sh)
md5sums=('SKIP' 'SKIP')

build() {
  cd "$srcdir"
  javac -cp "/usr/share/minecraft/Minecraft.jar" MinecraftIPv6.java
}

package() {
  install -Dm 644 MinecraftIPv6.class "$pkgdir/usr/share/minecraft/MinecraftIPv6.class"
  install -Dm 755 minecraft-ipv6.sh   "$pkgdir/usr/bin/minecraft-ipv6"
}
