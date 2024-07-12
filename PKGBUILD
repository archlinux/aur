# Maintainer: leoneii comdir@infonix.info

pkgname=agent-mailru
pkgver=23.2.0.2605
pkgrel=1
pkgdesc='Official agent Mail.Ru desktop client for Arch Linux'
arch=('x86_64')
url=https://agent.mail.ru/
license=("Custom")
depends=(
        libxcursor
        libxrandr
)
conflicts=('icqdesktop-bin' 'icqdesktop-git' 'icqdesktop' 'agent-bin' 'agent')
provides=('agent')


source=(
        'https://hb.bizmrg.com/agent-www/linux/x64/agent.tar.xz'
        'agent.png'
        'agent.desktop'
        "agentlink.install"
)

sha256sums=('8819651ba06ce14d2144d49f70e8e4823247418bb47940f8064550457245982d'
            'd13bd1c339b739fdbf678bed7cbdba09c5046cf598c3bf147cc16469534c8468'
            '051854c2c9bb6b50ec3ed1fe849cd454456879f1fa071df8403aedcfc5943e2d'
            '70e47339abb18cd2190ec31f51d5a1ede46d03c37612260324c092e42ccc9421')

install='agentlink.install'

build (){

mkdir ${srcdir}/Agent
bsdtar -xf  "agent.tar.xz" --directory ${srcdir}/Agent

}

package () {
        install -dm755  "$pkgdir/opt/agent"
        cp -r "${srcdir}/Agent/." "${pkgdir}/opt/agent"
        #install -Dm755 agent "$pkgdir/opt/agent"
       # ln -s "/opt/agent/agent" "${pkgdir}/usr/bin/agent"
        install -Dm644 agent.png "${pkgdir}/usr/share/pixmaps/agent.png"
        install -Dm644 agent.desktop "${pkgdir}/usr/share/applications/agent.desktop"
}

