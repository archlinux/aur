# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>
pkgname=codelite-bin
pkgver=8.0
pkgrel=1
pkgdesc="Cross platform IDE for the C/C++ programming languages"
arch=('i686' 'x86_64')
url="http://www.codelite.org/"
license=('GPL')
depends=('clang' 'desktop-file-utils' 'hicolor-icon-theme' 'webkitgtk2' 'wxgtk' 'curl' 'libssh' 'python2' 'libedit' 'glu')
pkgdesc="Open-source, cross platform IDE for the C/C++ programming languages"

makedepends=('chrpath')
optdepends=('graphviz: callgraph visualization')
install=codelite.install
replaces=('codelite' 'codelite-svn')
provides=('codelite')

if [[ $CARCH == i686 ]]; then
	source=('http://repos.codelite.org/rpms/fedora/codelite-8.0-1.fc21.i686.rpm' 'http://repos.codelite.org/wxCrafter-2.1/fedora/32/wxcrafter-2.1-1.i686.rpm')
	md5sums=('e5c1f6fda3cc4c2042708e360f834945' 'b4a8ba74eb77dbd4239e8fb430e24ead')
else
	source=('http://repos.codelite.org/rpms/fedora/codelite-8.0-1.fc21.x86_64.rpm' 'http://repos.codelite.org/wxCrafter-2.1/fedora/64/wxcrafter-2.1-1.x86_64.rpm')
	md5sums=('ff84dff257af4f0dac705d259c997ca8' '2e060bc371420afad430fb6a3facea4e')
fi

build() {
    cd $srcdir/
	if [[ $CARCH == x86_64 ]]; then
		mv ./usr/lib64 ./usr/lib
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/abbreviation.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CallGraph.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CMakePlugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CodeFormatter.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/CodeLiteDiff.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/codelitephp.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/ContinuousBuild.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Copyright.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/cppchecker.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/cscope.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/DatabaseExplorer.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/ExternalTools.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/git.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/HelpPlugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libdatabaselayersqlite.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/liblibcodelite.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libplugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libwxshapeframework.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/libwxsqlite3.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/LLDBDebugger.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/MemCheck.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Outline.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/QMakePlugin.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/SFTP.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/SnipWiz.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/SpellCheck.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Subversion.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Tweaks.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/UnitTestsPP.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/WebTools.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/Wizards.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/WordCompletion.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/wxCrafter.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/wxFormBuilder.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/ZoomNavigator.so
		chrpath -r /usr/lib/codelite ./usr/lib/codelite/debuggers/DebuggerGDB.so

#		chrpath -r /usr/lib/codelite ./usr/bin/clg++
#		chrpath -r /usr/lib/codelite ./usr/bin/clgcc
		chrpath -r /usr/lib/codelite ./usr/bin/codelite
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-cc
		chrpath -r /usr/lib/codelite ./usr/bin/codelite_cppcheck
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-echo
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_exec
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_fix_files
		chrpath -r /usr/lib/codelite ./usr/bin/codelite_indexer
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_kill_children
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-lldb
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-make
		chrpath -r /usr/lib/codelite ./usr/bin/codelite-terminal
#		chrpath -r /usr/lib/codelite ./usr/bin/codelite_xterm
	fi
	rm $srcdir/usr/lib/codelite/libwx_*
}

package() {
   cp -r $srcdir/usr $pkgdir
}
