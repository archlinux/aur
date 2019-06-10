# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=teamspeak3-kde-wrapper
pkgver=0.1
pkgrel=1
pkgdesc="Wrapper script that fixes the bug that URLs do not open on KDE"
arch=("any")
license=("GPL3")

depends=("bash" "teamspeak3" "kinit" "qt5-tools")
makedepends=()
provides=("kts3wrap")

source=("kts3wrap"
        "kts3wrap.desktop"
        "xdg-open")
sha512sums=('bd464669769fcaf59792d497ed9bfa9940380d6aa0051a91af1d9408e957be72b126124b17a8405fe2bce2763d3539c828399fa696d702a3c80a8e235d0148f8'
            '6b795ff37275e92bf5673c4dd2e0e69ad3f010567776350e44a4bf39048668e383610fc44c4c834b0444dc9132300d92fcc1d516b8421d89347289fdb6073a2a'
            '42a2b2cb0120257aa47e2c69b41d9028400736604ec6d27bdd4c9907e73463f4aceb368b36f8665a9ee9c930bb481d2f2986e15b3dea9d2149572dd55607c807')


package() {
    cd "$srcdir"

    install -v -m755 -D "kts3wrap" "$pkgdir/usr/bin/kts3wrap"
    install -v -m755 -D "xdg-open" "$pkgdir/opt/kts3wrap-bin/xdg-open"
    install -v -m644 -D "kts3wrap.desktop" "$pkgdir/usr/share/applications/kts3wrap.desktop"
}
