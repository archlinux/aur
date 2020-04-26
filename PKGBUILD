# Maintainer: X3n0m0rph59 <x3n0m0rph59@gmail.com>

pkgname='eruption-roccat-vulcan-git'
_pkgname='eruption-roccat-vulcan'
pkgdesc='Linux user-mode driver for the ROCCAT Vulcan 100/12x series keyboards'
pkgver='0.1.2'
pkgrel='0'
epoch=
arch=('i686' 'x86_64')
url='https://x3n0m0rph59.gitlab.io/eruption-roccat-vulcan/'
license=('GPL3+')
groups=()
depends=('libevdev' 'hidapi' 'systemd-libs' 'dbus' 'libpulse' 'alsa-lib')
makedepends=('git' 'rust')
checkdepends=()
optdepends=()
provides=()
conflicts=('eruption-roccat-vulcan')
replaces=()
backup=()
options=()
install='eruption.install'
changelog=
source=('git+https://gitlab.com/X3n0m0rph59/eruption-roccat-vulcan.git')
noextract=()
sha512sums=('SKIP')
PKGEXT='.pkg.tar.gz'

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

    mkdir -p "$pkgdir/var/lib/eruption/profiles"

    mkdir -p "$pkgdir/usr/lib/systemd/system"
    mkdir -p "$pkgdir/usr/lib/systemd/system-preset"

    mkdir -p "$pkgdir/usr/lib/udev/rules.d/"

    mkdir -p "$pkgdir/etc/dbus-1/system.d"

    mkdir -p "$pkgdir/usr/share/man/man8"
    mkdir -p "$pkgdir/usr/share/man/man5"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    mkdir -p "$pkgdir/usr/share/eruption/i18n"
    mkdir -p "$pkgdir/usr/share/eruption/sfx"

    install -m 755 "target/release/eruption" "$pkgdir/usr/bin/"
    install -m 644 "support/config/eruption.conf" "$pkgdir/etc/eruption/"

    install -m 644 "support/systemd/eruption.service" "$pkgdir/usr/lib/systemd/system/"
    install -m 644 "support/systemd/eruption.preset" "$pkgdir/usr/lib/systemd/system-preset/"

    install -m 644 "support/udev/99-eruption-roccat-vulcan.rules" "$pkgdir/usr/lib/udev/rules.d/"

    install -m 644 "support/dbus/org.eruption.control.conf" "$pkgdir/etc/dbus-1/system.d/"

    install -m 644 "support/man/eruption.8" "$pkgdir/usr/share/man/man8/"
    install -m 644 "support/man/eruption.conf.5" "$pkgdir/usr/share/man/man5/"

    install -m 644 "src/scripts/macros.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/macros.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/afterglow.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/afterglow.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/afterhue.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/afterhue.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz1.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz1.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz2.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz2.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz3.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz3.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz4.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz4.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz5.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/audioviz5.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/batique.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/batique.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/billow.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/billow.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/fbm.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/fbm.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/fire.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/fire.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/fireworks.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/fireworks.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/gaming.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/gaming.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/gradient.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/gradient.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/heartbeat.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/heartbeat.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/impact.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/impact.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/multigradient.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/multigradient.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/perlin.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/perlin.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/rainbow.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/rainbow.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/raindrops.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/raindrops.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/rmf.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/rmf.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/shockwave.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/shockwave.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/solid.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/solid.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/stripes.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/stripes.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/sysmon.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/sysmon.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/temperature.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/temperature.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/voronoi.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/voronoi.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/water.lua" "$pkgdir/usr/share/eruption/scripts/"
    install -m 644 "src/scripts/water.lua.manifest" "$pkgdir/usr/share/eruption/scripts/"

    install -m 644 "support/sfx/typewriter1.wav" "$pkgdir/usr/share/eruption/sfx/"
    install -m 644 "support/sfx/phaser1.wav" "$pkgdir/usr/share/eruption/sfx/"
    install -m 644 "support/sfx/phaser2.wav" "$pkgdir/usr/share/eruption/sfx/"
    ln -s "phaser1.wav" "$pkgdir/usr/share/eruption/sfx/key-down.wav"
    ln -s "phaser2.wav" "$pkgdir/usr/share/eruption/sfx/key-up.wav"

    install -m 644 "support/profiles/default.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/fx1.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/fx2.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/gaming.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile2.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile3.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/profile4.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/preset-red-yellow.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/preset-blue-red.profile" "$pkgdir/var/lib/eruption/profiles/"
    install -m 644 "support/profiles/spectrum-analyzer.profile" "$pkgdir/var/lib/eruption/profiles/"

    # Web-Frontend
    #mkdir -p "$pkgdir/usr/share/eruption/templates"
    #mkdir -p "$pkgdir/usr/share/eruption/static/css"
    #mkdir -p "$pkgdir/usr/share/eruption/static/css/themes/eruption"
    #mkdir -p "$pkgdir/usr/share/eruption/static/css/themes/metal"
    #mkdir -p "$pkgdir/usr/share/eruption/static/css/styles"
    #mkdir -p "$pkgdir/usr/share/eruption/static/js"
    #mkdir -p "$pkgdir/usr/share/eruption/static/font"
    #mkdir -p "$pkgdir/usr/share/eruption/static/img"
    #mkdir -p "$pkgdir/usr/share/eruption/static/img/bg"
    #mkdir -p "$pkgdir/usr/share/eruption/static/img/icons"

    #install -m 644 "templates/about.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/base.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/detail.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/documentation.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/profiles.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/soundfx.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/settings.html.tera" "$pkgdir/usr/share/eruption/templates/"
    #install -m 644 "templates/preview.html.tera" "$pkgdir/usr/share/eruption/templates/"

    #install -m 644 "static/css/animate.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/style.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/themes/eruption/colors.css" "$pkgdir/usr/share/eruption/static/css/themes/eruption/"
    #install -m 644 "static/css/themes/metal/colors.css" "$pkgdir/usr/share/eruption/static/css/themes/metal/"
    #install -m 644 "static/css/styles/tomorrow-night.css" "$pkgdir/usr/share/eruption/static/css/styles/"
    #install -m 644 "static/css/bootstrap.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap.css.map" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap.min.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap.min.css.map" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-grid.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-grid.css.map" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-grid.min.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-grid.min.css.map" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-reboot.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-reboot.css.map" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-reboot.min.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/bootstrap-reboot.min.css.map" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/css/fontawesome.min.css" "$pkgdir/usr/share/eruption/static/css/"
    #install -m 644 "static/font/fa-brands-400.eot" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-brands-400.svg" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-brands-400.ttf" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-brands-400.woff" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-brands-400.woff2" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-regular-400.eot" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-regular-400.svg" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-regular-400.ttf" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-regular-400.woff" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-regular-400.woff2" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-solid-900.eot" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-solid-900.svg" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-solid-900.ttf" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-solid-900.woff" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/fa-solid-900.woff2" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/Roboto-Regular.ttf" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/CuteFont-Regular.ttf" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/Roboto-Regular.woff2" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/font/CuteFont-Regular.woff2" "$pkgdir/usr/share/eruption/static/font/"
    #install -m 644 "static/img/bg_direction_nav.png" "$pkgdir/usr/share/eruption/static/img/"
    #install -m 644 "static/img/glyphicons-halflings.png" "$pkgdir/usr/share/eruption/static/img/"
    #install -m 644 "static/img/bg/bg-1.jpg" "$pkgdir/usr/share/eruption/static/img/bg/"
    #install -m 644 "static/img/icons/eruption.png" "$pkgdir/usr/share/eruption/static/img/icons/"
    #install -m 644 "static/img/favicon.png" "$pkgdir/usr/share/eruption/static/img/"
    #install -m 644 "static/js/animate.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/custom.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.bundle.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.bundle.js.map" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.bundle.min.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.bundle.min.js.map" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.js.map" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.min.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/bootstrap.min.js.map" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/jquery.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/fontawesome.min.js" "$pkgdir/usr/share/eruption/static/js/"
    #install -m 644 "static/js/highlight.pack.js" "$pkgdir/usr/share/eruption/static/js/"
}
