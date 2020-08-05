# Maintainer: X3n0m0rph59 <x3n0m0rph59@gmail.com>

pkgname='eruption-roccat-vulcan-git'
_pkgname='eruption-roccat-vulcan'
pkgdesc='Linux user-mode driver for the ROCCAT Vulcan 100/12x series keyboards'
pkgver='0.1.12'
pkgrel='0'
epoch=
arch=('i686' 'x86_64')
url='https://x3n0m0rph59.gitlab.io/eruption-roccat-vulcan/'
license=('GPL3+')
groups=()
depends=('libevdev' 'hidapi' 'systemd-libs' 'dbus' 'libpulse')
makedepends=('git' 'rust')
checkdepends=()
optdepends=()
provides=('eruption-roccat-vulcan')
conflicts=('eruption-roccat-vulcan')
replaces=()
backup=(etc/eruption/eruption.conf usr/share/eruption/scripts/lib/themes/* usr/share/eruption/scripts/lib/macros/*)
options=()
install='eruption.install'
changelog=
source=('git+https://gitlab.com/X3n0m0rph59/eruption-roccat-vulcan.git#commit=bf17f5999987535e3a882d53af7a7325f277db85')
noextract=()
sha512sums=('SKIP')

build() {
    cd "$_pkgname"

    CARGO_INCREMENTAL=0 cargo build --all --release
}

package() {
    cd "$_pkgname"

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/etc/eruption"
    mkdir -p "$pkgdir/usr/share/doc/eruption"
    mkdir -p "$pkgdir/usr/share/eruption/scripts"
    mkdir -p "$pkgdir/usr/share/eruption/scripts/lib"
    mkdir -p "$pkgdir/usr/share/eruption/scripts/lib/macros"
    mkdir -p "$pkgdir/usr/share/eruption/scripts/lib/themes"
    mkdir -p "$pkgdir/usr/share/eruption/scripts/examples"

    mkdir -p "$pkgdir/var/lib/eruption/profiles"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/lib/systemd/system-preset"

    mkdir -p "$pkgdir/usr/lib/udev/rules.d/"

    mkdir -p "$pkgdir/etc/dbus-1/system.d"

    mkdir -p "$pkgdir/usr/share/man/man8"
    mkdir -p "$pkgdir/usr/share/man/man5"
    mkdir -p "$pkgdir/usr/share/man/man1"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    mkdir -p "$pkgdir/usr/share/eruption/i18n"
    mkdir -p "$pkgdir/usr/share/eruption/sfx"

    install -m 755 "target/release/eruption" "$pkgdir/usr/bin/"
    install -m 755 "target/release/eruptionctl" "$pkgdir/usr/bin/"

    install -m 644 "support/config/eruption.conf" "$pkgdir/etc/eruption/"

    install -m 644 "support/systemd/eruption.service" "$pkgdir/usr/lib/systemd/system/"
    install -m 644 "support/systemd/eruption.preset" "$pkgdir/usr/lib/systemd/system-preset/"

    install -m 644 "support/udev/99-eruption-roccat-vulcan.rules" "$pkgdir/usr/lib/udev/rules.d/"

    install -m 644 "support/dbus/org.eruption.control.conf" "$pkgdir/etc/dbus-1/system.d/"

    install -m 644 "support/man/eruption.8" "$pkgdir/usr/share/man/man8/"
    install -m 644 "support/man/eruption.conf.5" "$pkgdir/usr/share/man/man5/"
    install -m 644 "support/man/eruptionctl.1" "$pkgdir/usr/share/man/man1/"

    install -m 644 "eruption/src/scripts/macros.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/macros.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/profiles.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/profiles.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/stats.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/stats.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/afterglow.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/afterglow.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/afterhue.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/afterhue.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz1.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz1.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz2.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz2.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz3.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz3.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz4.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz4.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz5.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/audioviz5.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/organic.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/organic.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/batique.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/batique.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/billow.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/billow.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/checkerboard.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/checkerboard.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/fbm.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/fbm.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/fire.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/fire.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/fireworks.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/fireworks.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/gaming.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/gaming.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/ghost.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/ghost.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/gradient.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/gradient.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/heatmap.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/heatmap.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/linear-gradient.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/linear-gradient.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/heartbeat.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/heartbeat.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/impact.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/impact.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/multigradient.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/multigradient.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/osn.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/osn.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/perlin.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/perlin.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/phonon.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/phonon.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/psychedelic.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/psychedelic.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/rainbow.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/rainbow.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/raindrops.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/raindrops.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/rmf.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/rmf.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/shockwave.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/shockwave.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/solid.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/solid.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/stripes.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/stripes.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/sysmon.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/sysmon.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/swirl-perlin.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/swirl-perlin.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/swirl-turbulence.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/swirl-turbulence.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/swirl-voronoi.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/swirl-voronoi.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/temperature.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/temperature.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/turbulence.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/turbulence.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/voronoi.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/voronoi.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/water.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/water.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/wave.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/wave.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/snake.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/snake.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "eruption/src/scripts/lib/debug.lua" "$pkgdir/usr/share/eruption/scripts/lib/"
    install -m 644 "eruption/src/scripts/lib/queue.lua" "$pkgdir/usr/share/eruption/scripts/lib/"
    install -m 644 "eruption/src/scripts/lib/utilities.lua" "$pkgdir/usr/share/eruption/scripts/lib/"
    install -m 644 "eruption/src/scripts/lib/declarations.lua" "$pkgdir/usr/share/eruption/scripts/lib/"
    install -m 644 "eruption/src/scripts/lib/themes/default.lua" "$pkgdir/usr/share/eruption/scripts/lib/themes/"
    install -m 644 "eruption/src/scripts/lib/themes/gaming.lua" "$pkgdir/usr/share/eruption/scripts/lib/themes/"
    install -m 644 "eruption/src/scripts/lib/macros/modifiers.lua" "$pkgdir/usr/share/eruption/scripts/lib/macros/"
    install -m 644 "eruption/src/scripts/lib/macros/user-macros.lua" "$pkgdir/usr/share/eruption/scripts/lib/macros/"
    install -m 644 "eruption/src/scripts/lib/macros/user-mappings.lua" "$pkgdir/usr/share/eruption/scripts/lib/macros/"
    install -m 644 "eruption/src/scripts/lib/macros/starcraft2.lua" "$pkgdir/usr/share/eruption/scripts/lib/macros/"
    install -m 644 "eruption/src/scripts/examples/simple.lua" "$pkgdir/usr/share/eruption/scripts/examples/"

    install -m 644 "support/sfx/typewriter1.wav" "$pkgdir/usr/share/eruption/sfx/"
    install -m 644 "support/sfx/phaser1.wav" "$pkgdir/usr/share/eruption/sfx/"
    install -m 644 "support/sfx/phaser2.wav" "$pkgdir/usr/share/eruption/sfx/"
    ln -s "phaser1.wav" "$pkgdir/usr/share/eruption/sfx/key-down.wav"
    ln -s "phaser2.wav" "$pkgdir/usr/share/eruption/sfx/key-up.wav"

    install -m 644 "support/profiles/default.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/fx1.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/fx2.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/fireworks.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/gaming.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/gradient-noise.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/heatmap.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/heatmap-errors.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/matrix.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/batique.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/checkerboard.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile1.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile2.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile3.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile4.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/psychedelic.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/twinkle.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/rainbow.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/preset-red-yellow.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/preset-blue-red.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/rainbow-wave.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/snake.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/solid-wave.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/starcraft2.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/spectrum-analyzer.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/vu-meter.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/swirl-perlin.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/swirl-perlin-blue-red.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/swirl-perlin-red-yellow.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/swirl-turbulence.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/swirl-voronoi.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/turbulence.profile" "$pkgdir/var/lib/eruption/profiles/"
}
