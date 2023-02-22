# Maintainer: Piotr Kubaty
pkgname=graph-editor-bin
pkgver=0.1
pkgrel=1
pkgdesc="apk of graph-editor-for-android application, built from https://github.com/Student-Team-Projects/Graph-Editor-Android, https://github.com/Student-Team-Projects/Graph-Editor-Core"
arch=(x86_64)
url="https://github.com/Student-Team-Projects/Graph-Editor-Android-bin"
license=('GPL')
makedepends=('git')
source=("git+$url#branch=main")
md5sums=('SKIP')

build() {
	cd "Graph-Editor-Android-bin"
}

package() {
	cd "Graph-Editor-Android-bin"
	adb install -t graph-editor-for-android.apk
	adb shell am start -n "com.example.graph_editor/com.example.graph_editor.menu.MenuActivity" -a android.intent.action.MAIN -c android.intent.category.LAUNCHER
}
